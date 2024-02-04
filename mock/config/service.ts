// deno-lint-ignore-file require-await
import Result from "../utils/result.ts";

export async function handlerConfigInfo(_: Request): Promise<Response> {
  return Result.success({
    download: "https://www.pgyer.com/bpkr9d",
    now: +new Date(),
  }).toResponse();
}
