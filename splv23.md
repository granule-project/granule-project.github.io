---
layout: start
title: The Granule Project
---

<style>
  p, div {
    text-align: justify;
  }
</style>

## Downloading / installing Granule

## Granule Language Server and VSCode Extension

There is an extension for VSCode that you can get in the usual way from
inside VSCode:

<img src="images/vscode-extension.pdf" />

This uses the [Granule Language Server (grls)](https://github.com/granule-project/granule/tree/main/server) if you want to get support in any other editor that support the LSP.

<img src="https://github.com/granule-project/granule/raw/dev-minor/server/vscode-diagnostics.gif" />

Additional key bindings in vscode:

* `Ctrl-e Ctrl-e`: attempts to synthesis a goal in a hole (written either `?` or `{! !}`.
* `Ctrl-e Ctrl-h`: attempts to rewrite the non-empty hole under the cursor (if there is one)
* `Ctrl-e Ctrl-u`: converts ASCII characters to their Unicode equivalents in the whole file.
* `Ctrl-e Ctrl-a`: converts Unicode characters to their ASCII equivalents in the whole file.

## [Documentation](https://granule-project.github.io/docs)

## [Exercises](https://granule-project.github.io/splv23-exercises.pdf)

## Slides

* [Part 1 (Sessions 1 and 2)](https://granule-project.github.io/splv23-slides-part1.pdf)
* [Part 2]
* [Part 3]