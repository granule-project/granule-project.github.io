---
layout: page
title: PhD opportunities and projects
---

[Dominic](http://dorchard.co.uk) is currently looking for new PhD students to join
the Granule project, at the [School of Computing](http://www.cs.kent.ac.uk), [University of Kent](http://www.kent.ac.uk) which is based in Canterbury, UK.

Here are some possible starting points for projects.

### Program synthesis from type-based resource-sensitive specifications

Type systems are one of the most widely deployed verification techniques in programming today. Type systems offer a simple "first defense" against a range of programming mistakes, directly within a language. Since types provide partial specifications of program behaviour, it is sometimes possible to use a type specification (a type signature) to derive parts of a program automatically (program synthesis) therefore speeding up programming. Type-based program synthesis is especially powerful in the context of more advance type theories, such as dependent types, where the synthesis amounts to proof search in logic. Various languages such as Agda and Idris now provide interactive modes where the human and the computer work together to write a program, with a programmer writing a specification and the compiler synthesising as much of a candidate program as possible, and so on. The aim of this project is to take program synthesis to the next level by combining dependent types with linear and graded types. Linear and graded types provide mechanisms for explaining where and how data is used, allowing a view of data as a resource with possible constraints attached. Linear and graded types further restrict the set of possible programs and thus offer a way to improve program synthesis by further constraining a program via "resource sensitive" types. This project will develop both the theory and practice, with a chance to implement the program synthesis / proof search techniques on top of the state-of-the-art language Granule.

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
