Deno.serve((_: Request) => {
  return new Response("Hello World");
});
