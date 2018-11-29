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
```
$ mix run ./scripts/run.exs http://smartwalls.cz
===> Compiling idna
===> Compiling hackney
Compiling 1 file (.ex)
warning: variable "links" is unused
  lib/title_fetch.ex:43

warning: variable "response" is unused
  lib/title_fetch.ex:36

http://smartwalls.cz
** (UndefinedFunctionError) function :idna_data.lookup/1 is undefined (module :idna_data is not available)
    (idna) :idna_data.lookup(107)
    (idna) /Users/dal/projects/erlang-idna/src/idna.erl:184: :idna.check_initial_combiner/1
    (idna) /Users/dal/projects/erlang-idna/src/idna.erl:256: :idna.check_label/4
    (idna) /Users/dal/projects/erlang-idna/src/idna.erl:315: :idna.ulabel/1
    (idna) /Users/dal/projects/erlang-idna/src/idna.erl:279: :idna.alabel/1
    (idna) /Users/dal/projects/erlang-idna/src/idna.erl:145: :idna.encode_1/2
    (hackney) /Users/dal/projects/hackney/src/hackney_url.erl:100: :hackney_url.normalize/2
    (hackney) /Users/dal/projects/hackney/src/hackney.erl:306: :hackney.request/5
```

## How to reproduce
- install dependencies and compile them
- run
```
  $ mix run ./scripts/run.exs http://www.smartwalls.cz
```

- edit lib/title_fetch.ex

```
  diff --git a/lib/title_fetch.ex b/lib/title_fetch.ex
  index 6d34b5d..86feee2 100644
  --- a/lib/title_fetch.ex
  +++ b/lib/title_fetch.ex
  @@ -42,7 +42,7 @@ defmodule TitleFetch do
           content_size = get_header(headers, "Content-Length")
           links = get_links(body)

  -        IO.puts("#{url} -> #{get_title(body)} #{content_type} #{content_size}")
  +        IO.puts("#{url} -> #{get_title(body)} #{get_language(body)} #{content_type} #{content_size}")

         status_code in [301, 302, 303, 307, 308] ->
           location = get_header(headers, "Location")
```

- run the same command again
- error should occur

## Notes
I have erlang-idna and hackney locally for testing purposes and I removed try/catch block from idna in `a-label` function. 
When there is the try catch block, it returns bad_label error with ulabel error undef. undef is returned when non-existing function is called.

`_build.broken` - backup of build when this error happened
