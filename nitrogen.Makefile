# Copied from https://github.com/mattiash/nitrogen_skeleton
all: get-deps compile

get-deps:
	rebar get-deps

compile:
	mkdir -p apps/{{appid}}/priv/static
	rebar compile
	rm -rf apps/{{appid}}/priv/static/nitrogen
	cp -R deps/nitrogen_core/www apps/{{appid}}/priv/static/nitrogen

clean:
	rebar clean
	rm -rf apps/{{appid}}/priv/static/nitrogen

full-clean:
	rebar clean
	rm apps/{{appid}}/priv/templates/*
	rm apps/{{appid}}/priv/static/js/*
	rm apps/{{appid}}/priv/static/css/*
	rm apps/{{appid}}/priv/static/images/*

run:
	erl -pa apps/*/ebin ./deps/*/ebin ./deps/*/include -name nitrogen@127.0.0.1 -eval "application:start({{appid}})."
