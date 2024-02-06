export interface UserModel {
  mobile: string;
  password: string;
  token: string;
}

export interface UserLoginAndRegisterModel {
  mobile: string;
  kind: number;
  code: number;
  signal: number;
  password: string;
}
