# Journeys 

Beginner-friendly OCaml exercise. You can find more details in Mike Hadlow and Mark Seemann's pages.

Mike Hadlow [github](https://github.com/mikehadlow/Journeys)

Mark Seemann [blog](https://blog.ploeh.dk/2019/10/28/a-basic-haskell-solution-to-the-robot-journeys-coding-exercise/)

# Requirements

- OCaml 4.x
- opam, [core](https://opensource.janestreet.com/core/) and [dune](https://dune.build/)

# Build / Run

```
$ opam install core
$ dune build journeys.exe
$ ./_build/default/journeys.exe journeys
1 1 E: true
3 3 N: true
2 4 S: true
5 4 E: true
```
