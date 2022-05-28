---
layout: start
title: The Granule Project
---

<a href="https://github.com/granule-project/granule"><img style="position: absolute; top: 0; right: 0; border: 0;" src="https://camo.githubusercontent.com/652c5b9acfaddf3a9c326fa6bde407b87f7be0f4/68747470733a2f2f73332e616d617a6f6e6177732e636f6d2f6769746875622f726962626f6e732f666f726b6d655f72696768745f6f72616e67655f6666373630302e706e67" alt="Fork me on GitHub" data-canonical-src="https://s3.amazonaws.com/github/ribbons/forkme_right_orange_ff7600.png"></a>

<style>
  p, div {
    text-align: justify;
  }
</style>

The Granule project is an ambitious research project whose focus is to
capture more and more _intensional_ properties of programs at the
type-level, that is, _how_ a program computes not just _what_ it computes.
Our primary mechanism for doing this is via the relatively new notion of
_graded types_ in concert with other typing mechanisms like linear
types and dependent types. For example, graded modal types can be
combined with linear types to make resource sensitivity an integral
aspect of a programming language, precisely enforcing resource usage
throughout the language. Other examples include capturing fine-grained
information about side effects, data use, privacy levels, cost, and
permissions via various kinds of (co)effect types captures via graded
modal types.

Our project spans theoretical and practical work.  We are actively
developing an implementation of a language with graded, linear,
and indexed types called [Granule](/granule.html) based on our
research.  In addition, we are developing a new dependent type theory
that will greatly expand the expressive power of Granule's type
system. This is currently implemented in another language called [Gerty](https://github.com/granule-project/gerty).
