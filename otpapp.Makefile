REBAR:=rebar
APPSRC:=apps/{{appid}}/src/{{appid}}.app.src
VERSION:=$(shell grep vsn $(APPSRC) | awk -F\" '{print $$2}')


.PHONY: all erl test clean doc 

all: erl

erl:
	$(REBAR) get-deps compile

test: all
	@mkdir -p .eunit
	$(REBAR) skip_deps=true eunit

update:
	$(REBAR) update-deps

release: all
	$(REBAR) generate
	tar jcf rel/{{appid}}_$(VERSION).tbz2 -C rel {{appid}}

clean:
	$(REBAR) clean
	-rm -rvf deps ebin doc .eunit

doc:
	$(REBAR) doc

run:
	ERL_LIBS=deps erl -pa apps/*/ebin apps/*/include -name {{appid}}@127.0.0.1 -eval "application:start({{appid}})."
