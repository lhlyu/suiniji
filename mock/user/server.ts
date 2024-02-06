import Result from "../utils/result.ts";
import { UserLoginAndRegisterModel, UserModel } from "./model.ts";
import { getBody, getUrl, isPhoneNumber } from "../utils/utils.ts";
import getPrime from "./prime.ts";

const kv = await Deno.openKv();

const expireIn = 1000 * 60 * 60;

// 检查手机号码
export async function handlerUserMobile(req: Request): Promise<Response> {
  const url = getUrl(req);

  const mobile = url.searchParams.get("mobile") ?? "";

  if (!isPhoneNumber(mobile)) {
    return Result.failed(2, "手机号码格式不对").toResponse();
  }

  const r = await kv.get<UserModel>(["user", mobile]);

  let signal = 0;
  if (Math.random() > 0.7) {
    const [v1, v2] = getPrime();
    await kv.set(["mobile", mobile], v2, { expireIn: expireIn });
    signal = v1;
  }

  if (r) {
    return Result.success({
      has: true,
      signal: signal,
    }).toResponse();
  }

  return Result.success({
    has: false,
    signal: signal,
  }).toResponse();
}

// 登录
export async function handlerLoginAndRegister(req: Request): Promise<Response> {
  const body = await getBody<UserLoginAndRegisterModel>(req);

  if (!isPhoneNumber(body.mobile)) {
    return Result.failed(3, "手机号码格式不对").toResponse();
  }

  const r = await kv.get<UserModel>(["user", body.mobile]);

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

    await kv.set(["user", user.mobile], user, { expireIn });

    return Result.success({
      uid: body.mobile,
      token: user.token,
    }).toResponse();
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
      await kv.set(["user", user.mobile], user, { expireIn });

      return Result.success({
        uid: body.mobile,
        token: user.token,
      }).toResponse();
    case 2:
      if (body.password != u.password) {
        return Result.failed(7, "密码错误").toResponse();
      }
      await kv.set(["user", user.mobile], user, { expireIn });

      return Result.success({
        uid: body.mobile,
        token: user.token,
      }).toResponse();
  }
  return Result.failed(8, "未知登录").toResponse();
}

// 退出登录
export async function handlerLogout(req: Request): Promise<Response> {
  const uid = req.headers.get("uid") ?? "";

  await kv.delete(["user", uid]);

  return Result.success(null).toResponse();
}

// 发送短信
export async function handlerCaptcha(req: Request): Promise<Response> {
  const body = await getBody<UserLoginAndRegisterModel>(req);

  if (!isPhoneNumber(body.mobile)) {
    return Result.failed(9, "手机号码格式不对").toResponse();
  }

  const c = (await kv.get<number>(["mobile", body.mobile])) ?? 0;

  if (c.value !== body.signal) {
    return Result.failed(10, "验证错误").toResponse();
  }

  await kv.delete(["mobile", body.mobile]);

  return Result.success(null).toResponse();
}
