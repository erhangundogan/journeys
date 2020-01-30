# Journeys 

Beginner-friendly OCaml exercise. You can find more details in Mike Hadlow and Mark Seemann's pages.

- Mike Hadlow [github](https://github.com/mikehadlow/Journeys)

- Mark Seemann [blog](https://blog.ploeh.dk/2019/10/28/a-basic-haskell-solution-to-the-robot-journeys-coding-exercise/)

Also great article from Mark Seemann about programming katas https://blog.ploeh.dk/2020/01/13/on-doing-katas/

# Requirements

- OCaml >= 4.06
- Opam, [Core](https://opensource.janestreet.com/core/) and [Dune](https://dune.build/)

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
