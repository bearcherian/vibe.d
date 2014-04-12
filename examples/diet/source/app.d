import vibe.appmain;
import vibe.http.server;

void handleRequest(HTTPServerRequest req, HTTPServerResponse res)
{
	string local_var = "Hello, World!";
	bool is_admin = false;
	res.headers["Content-Type"] = "text/html";
	
	res.render!("diet.dt", req, local_var, is_admin);
	//res.renderCompat!("diet.dt",
	//	HTTPServerRequest, "req",
	//	string, "local_var")(req, local_var);
}

shared static this()
{
	auto settings = new HTTPServerSettings;
	settings.port = 8080;
	settings.bindAddresses = ["::1", "127.0.0.1"];
	
	listenHTTP(settings, &handleRequest);
}
