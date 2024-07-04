


export async function signAuth(request: Request, env: any, context: any) {
    if (request.headers.get('Authorization').substring(7).length < 10) {
        return Response.json({
            code: 401,
            msg: '凭证无效'
        }, {
            status: 401
        })
    }

}