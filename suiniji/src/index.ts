import { OpenAPIRouter } from "@cloudflare/itty-router-openapi";
import { ApiLogin } from "./account/api_login";
import {signCheck} from "./middleware/sign";
import {signAuth} from "./middleware/auth";

export const router = OpenAPIRouter({
	docs_url: "/",
});

router.all("/api/*", signCheck)

router.post("/api/login", ApiLogin);

router.all('/api/*', signAuth)

// 404 for everything else
router.all("*", () =>
	Response.json(
		{
			success: false,
			error: "Route not found",
		},
		{ status: 404 }
	)
);

export default {
	fetch: router.handle,
} as any
