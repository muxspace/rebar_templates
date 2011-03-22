-module(page1).
-include_lib("nitrogen_core/include/wf.hrl").
-compile(export_all).
            
main() ->
       {{appid}}_common:assert_path( "grid.html" ).

title() -> "Nitrogen Web Framework for Erlang".

layout() ->
    #container_12 { body=[
        #grid_12 { class=header, body={{appid}}_common:header(page1) },
        #grid_clear {},

        #grid_12 { body="Page 1" },
        #grid_clear {},

        #grid_12 { body={{appid}}_common:footer() }
    ]}.
