import {
    OpenAPIRoute,
    Path,
    Str,
} from '@cloudflare/itty-router-openapi'

export interface Env {
    KV: KVNamespace;
}

interface RequestParam {
    country_code: number
    mobile: string
    // 登录方式: 1 - 验证码; 2 - 密码
    kind: number
    captcha: string
    password: string
}

export class ApiLogin extends OpenAPIRoute {
    static schema = {
        tags: ['Tasks'],
        summary: '登录或注册',
        parameters: {
            taskSlug: Path(Str, {
                description: '登录',
            }),
        },
        responses: {
            '200': {
                description: 'Task fetched successfully',
                schema: {
                    code: Number,
                    msg: String,
                    data: {}
                },
            },
        },
    }

    async handle(request: Request, env: any, context: any, data: Record<string, any>) {
        const param = (await request.json()) as RequestParam
        const has = (await env.KV.get(param.mobile)) == null

        if (!has) {
            return {
                code: 0,
                msg: 'ok',
                data: {
                    has: has,
                }
            }
        }

        return {

        }
    }
}