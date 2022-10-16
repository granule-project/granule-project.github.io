---
layout: start
title: The Granule Project
---

<style>#forkongithub a{background:#0750d0;color:#fff;text-decoration:none;font-family:arial,sans-serif;text-align:center;font-weight:bold;padding:5px 40px;font-size:1rem;line-height:2rem;position:relative;transition:0.5s;box-sizing:content-box;}#forkongithub a:hover{background:#d64800;color:#fff;}#forkongithub a::before,#forkongithub a::after{content:"";width:100%;display:block;position:absolute;top:1px;left:0;height:1px;background:#fff;}#forkongithub a::after{bottom:1px;top:auto;}@media screen and (min-width:1024px){#forkongithub{position:absolute;display:block;top:0;right:0;width:200px;overflow:hidden;height:200px;z-index:9999;}#forkongithub a{width:200px;position:absolute;top:60px;right:-60px;transform:rotate(45deg);-webkit-transform:rotate(45deg);-ms-transform:rotate(45deg);-moz-transform:rotate(45deg);-o-transform:rotate(45deg);box-shadow:4px 4px 10px rgba(0,0,0,0.8);}}</style><span id="forkongithub"><a href="https://github.com/granule-project/granule">Fork me on GitHub</a></span>

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
