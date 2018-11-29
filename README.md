# TitleFetch

# Versions

## Mix
Erlang/OTP 21 [erts-10.0.5] [source] [64-bit] [smp:4:4] [ds:4:4:10] [async-threads:1] [hipe]

Mix 1.7.4 (compiled with Erlang/OTP 21)

## Elixir
Erlang/OTP 21 [erts-10.0.5] [source] [64-bit] [smp:4:4] [ds:4:4:10] [async-threads:1] [hipe]

Elixir 1.7.4 (compiled with Erlang/OTP 21)

## Erlang
Erlang/OTP 21 [erts-10.0.5] [source] [64-bit] [smp:4:4] [ds:4:4:10] [async-threads:1] [hipe]


## Error 
mix run ./scripts/run.exs http://kolkovna.cz
===> Compiling idna
===> Compiling hackney
Compiling 1 file (.ex)
warning: variable "links" is unused
  lib/title_fetch.ex:43

warning: variable "response" is unused
  lib/title_fetch.ex:36

http://kolkovna.cz
** (UndefinedFunctionError) function :idna_data.lookup/1 is undefined (module :idna_data is not available)
    (idna) :idna_data.lookup(107)
    (idna) /Users/dal/Work/Analyticoo/erlang-idna/src/idna.erl:184: :idna.check_initial_combiner/1
    (idna) /Users/dal/Work/Analyticoo/erlang-idna/src/idna.erl:256: :idna.check_label/4
    (idna) /Users/dal/Work/Analyticoo/erlang-idna/src/idna.erl:315: :idna.ulabel/1
    (idna) /Users/dal/Work/Analyticoo/erlang-idna/src/idna.erl:279: :idna.alabel/1
    (idna) /Users/dal/Work/Analyticoo/erlang-idna/src/idna.erl:145: :idna.encode_1/2
    (hackney) /Users/dal/Work/Analyticoo/hackney/src/hackney_url.erl:100: :hackney_url.normalize/2
    (hackney) /Users/dal/Work/Analyticoo/hackney/src/hackney.erl:306: :hackney.request/5
