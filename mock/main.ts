import { handlerConfigInfo } from "./config/service.ts";
import { handlerLogout } from "./user/server.ts";
import {
  handlerCaptcha,
  handlerLoginAndRegister,
  handlerUserMobile,
} from "./user/server.ts";
import Result from "./utils/result.ts";

type handlerFn = (req: Request) => Promise<Response>;

const routes: Record<string, handlerFn> = {
  // config
  "GET:/api/config/info": handlerConfigInfo,
  // user
  "GET:/api/user/mobile": handlerUserMobile,
  "POST:/api/user/auth": handlerLoginAndRegister,
  "POST:/api/user/logout": handlerLogout,
  "POST:/api/user/captcha": handlerCaptcha,
};

Deno.serve(async (req: Request) => {
  const method = req.method;
  const url = new URL(req.url);

  const route = `${method}:${url.pathname}`;

  if (route in routes) {
    return await routes[route](req);
  }

  return Result.failed(1, "你请求了一个寂寞").toResponse();
});
