class Result<T> {
  code: number;
  msg: string;
  data: T;

  constructor(data: T, msg: string = "", code: number = 0) {
    this.code = code;
    this.msg = msg;
    this.data = data;
  }

  static success<U>(data: U) {
    return new Result<U>(data);
  }

  static failed(code: number, msg: string) {
    return new Result(null, msg, code);
  }

  public toResponse() {
    return new Response(JSON.stringify(this), {
      status: 200,
      headers: { "Content-Type": "application/json" },
    });
  }
}

export default Result;
