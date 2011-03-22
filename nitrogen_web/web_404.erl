-module(web_404).

-include_lib ("nitrogen_core/include/wf.hrl").
-export ([main/0,path/0]).

main() ->
    wf:status_code(404),
    #template { file=filename:join([code:priv_dir(web),
				    "templates", "404.html"]) }.

path() ->
    RequestBridge = wf_context:request_bridge(),
    RequestBridge:path().

       
