export function getUrl(req: Request): URL {
  return new URL(req.url);
}

export async function getBody<T>(req: Request): Promise<T> {
  const body = await req.json();
  return body as T;
}

export function isPhoneNumber(str: string): boolean {
  const pattern = /^\d{11}$/;
  return pattern.test(str);
}
