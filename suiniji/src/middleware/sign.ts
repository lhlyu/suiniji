import * as crypto from "crypto";


function getHeaders(request: Request) {
    return {
        'Authorization': request.headers.get('Authorization'),
        'Version': request.headers.get('Version'),
        'Ts': request.headers.get('Ts'),
        'Os': request.headers.get('Os'),
        'Channel': request.headers.get('Channel'),
        'Nonce': request.headers.get('Nonce'),
    } as Record<string, any>
}

function getQueryParams(request: Request) {
    return new URL(request.url).searchParams as Record<string, any>
}

async function getBodyParams(request: Request) {
    return (await request.json()) as Record<string, any>
}

function getOtherParams(request: Request) {
    const u = new URL(request.url)

    return {
        'method': request.method,
        'uri': u.pathname + u.search,
    } as Record<string, any>
}


function sortParams(params: Record<string, any>): Record<string, any> {
    const sortedKeys = Object.keys(params).sort()
    const sortedParams: Record<string, any> = {}

    sortedKeys.forEach((key) => {
        const value = params[key]
        if (typeof value === 'object') {
            sortedParams[key] = sortParams(value)
        } else {
            sortedParams[key] = value
        }
    })

    return sortedParams
}

function getSign(allParams: Record<string, any>) {
    const jsonString = JSON.stringify(allParams)
    const hash = crypto.createHash('sha256')
    hash.update(jsonString + this.secretKey)
    return hash.digest().toString()
}

export async function signCheck(request: Request, env: any, context: any) {

    const allParams = {
        'header': getHeaders(request),
        'query': getQueryParams(request),
        'body': await getBodyParams(request),
        'other': getOtherParams(request),
    }

    const headerSign = request.headers.get("Sign")

    const sign = getSign(sortParams(allParams))

    console.log(`sign: ${sign} - ${headerSign}`)

    if (headerSign != sign) {
        return Response.json({
            code: 400,
            msg: '签名失败'
        }, {
            status: 400
        })
    }

}