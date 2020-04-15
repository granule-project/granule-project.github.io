---
layout: page
title: PhD opportunities and projects
---

[Dominic](http://dorchard.co.uk) is currently looking for new PhD students to join
the Granule project, at the [School of Computing](http://www.cs.kent.ac.uk), [University of Kent](http://www.kent.ac.uk) which is based in Canterbury, UK. You can find details of how to apply on [here](https://www.cs.kent.ac.uk/research/studyingforaphd/index.html). The deadline for applications is usually late January.

Here are some possible starting points for projects.

### Multi-stage semantics and typing via graded modalities

Staged computation (otherwise known as meta programming) is a powerful technique
for writing programs that generate programs. This might be in a simple macro
language, or a more involved compile-time code generator, or even a multi-stage pipeline of multiple languages or sublanguages, including JIT. It turns
out that intuitionistic modal S4 logic generates a useful type system for staged
computations (through a Curry-Howard like isomorphism), detailed in the work of
Davies and Pfenning (A modal analysis of staged computation, 2001). The aim of
this project is to generalise their approach to graded modalities, capturing truly
multi-stage programs: not just 2 stages, but n-stages, with their interactions
controlled and described by a graded modal type system. This approach can then
be combined with other kinds of graded modality to explain the role of data
across multiple levels of a staged compilation pipeline.

### Grade-directed compilation and verifying optimisations

Graded types provide the opportunity to capture program properties at the type level,
akin to internalising a static analysis. This aids the programmer in reasoning about
their programs, but can also provide benefits to the compiler: the information in
grades can be used to direct compilation. This project would develop a compiler
for Granule (or a similar language with graded types) that uses the type information
to perform optimisations, e.g., leveraging linear types and bounded-reused modalities
to statically de-allocate memory and use mutation where possible, or using security
modalities to change how binaries are compiled to obscure data and data structures.
An additional, or alternate, project is to push grades into a semantics in order
to verify compiler optimisations at the semantic level. Initial work suggests
that graded structures in semantics (e.g. graded monads and graded comonads) can
allow common optimisations to be proved correct in a unified way at the denotational
level, allowing a new compiler verification technique. There is a lot of work
to be done here.
