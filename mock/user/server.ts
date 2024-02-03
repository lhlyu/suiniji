import Result from "../utils/result.ts";
import { UserLoginAndRegisterModel, UserModel } from "./model.ts";
import { getBody, getUrl, isPhoneNumber } from "../utils/utils.ts";

const kv = await Deno.openKv();

// 检查手机号码
export async function handlerUserMobile(req: Request): Promise<Response> {
  const url = getUrl(req);

  const mobile = url.searchParams.get("mobile") ?? "";

  if (!isPhoneNumber(mobile)) {
    return Result.failed(2, "手机号码格式不对").toResponse();
  }

  const r = await kv.get(["user", mobile]);

  if (r) {
    return Result.success({
      has: true,
    }).toResponse();
  }

  return Result.success({
    has: false,
  }).toResponse();
}

// 登录
export async function handlerLoginAndRegister(req: Request): Promise<Response> {
  const body = await getBody<UserLoginAndRegisterModel>(req);

  if (!isPhoneNumber(body.mobile)) {
    return Result.failed(3, "手机号码格式不对").toResponse();
  }

  const r = await kv.get(["user", body.mobile]);

  // 如果不存在则注册
  if (!r) {
    if (body.code < 5000) {
      return Result.failed(4, "验证码错误").toResponse();
    }
    if (body.password.length < 4) {
      return Result.failed(5, "密码至少要四位数以上").toResponse();
    }

    const user: UserModel = {
      mobile: body.mobile,
      password: body.password,
      token: +new Date() + "",
    };

    await kv.set(["user", user.mobile], user);

    return Result.success(user.token).toResponse();
  }

  const u = r.value as UserModel;

  const user: UserModel = {
    mobile: u.mobile,
    password: u.password,
    token: +new Date() + "",
  };

  // 存在则验证是否登录成功
  switch (body.kind) {
    case 1:
      if (body.code < 5000) {
        return Result.failed(6, "验证码错误").toResponse();
      }
      await kv.set(["user", user.mobile], user);

      return Result.success(user.token).toResponse();
    case 2:
      if (body.password != u.password) {
        return Result.failed(7, "密码错误").toResponse();
      }
      await kv.set(["user", user.mobile], user);
      return Result.success(user.token).toResponse();
  }
  return Result.failed(8, "未知登录").toResponse();
}

// 发送短信
export async function handlerCaptcha(req: Request): Promise<Response> {
  const body = await getBody<UserLoginAndRegisterModel>(req);

  if (!isPhoneNumber(body.mobile)) {
    return Result.failed(9, "手机号码格式不对").toResponse();
  }
  return Result.success(null).toResponse();
}
