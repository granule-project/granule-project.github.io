---
layout: page
title: PhD opportunities and projects
---

## PhD Opportunities with Harley Eades at Augusta University

Harley Eades of the Granule Project and Augusta University's ForML Lab
is actively seeking applications for a PhD student starting Fall 2021.
The successful applicant will be funded--including tuition, salary,
and (international) conference travel--for the first three years of
their appointment through a new NSF funded project:

"Semantically and Practically Generalizing Graded Modal Types"

A short overview of the main goals of this project is as follows:

"We propose to investigate the theory and practice of graded modal
types with the goal of combining and generalizing type-based software
verification and data-usage tracking, thereby extending the
verification abilities of type systems. To carry out this research we
plan to:

1. investigate a new foundational theory for graded modal types based
   on the underlying theory of constructive modal logics that will
   support several new kinds of data-usage tracking making them more
   applicable to real-world problems.

2. design and implement Tenli; a general purpose functional
   programming language with graded modal types that supports general
   type-based software verification;

3. design new pedagogical materials for teaching resourceful software
   verification at both the undergraduate and graduate levels using
   Tenli, and other tools."

The successful applicant will be advised by Harley Eades, but also
collaborate with Dominic Orchard and his students in the Granule
Project.  In addition, they will have the opportunity to help mentor
summer undergraduate research assistants through new collaborations
with:

- Clark Atlanta: A historically black university, and
- Wesleyan College: An all womens school in Georgia.

This is also an exciting time to join the ever growing Augusta
University who has made Computer Science one of the main pillars of
their university.  We have successfully recruited ten new faculty (at
all ranks) per year for the last three years.  Fall 2021 marks the
[inaugural year of our PhD
program](https://jagwire.augusta.edu/school-of-computer-and-cyber-sciences-to-offer-new-phd-program/)
and the successful applicant will be among the first PhD students in
Computer
Science at our university.  

Even though this is the inaugural year of our PhD program Harley Eades
has mentored and collaborated with several PhD students over the
course of the last six years.  As part of a different NSF funded
project Harley Eades recruited and collaborated with three PhD
students from other universities through stipends.  In addition, he
actively collaborates with and has helped mentor PhD students working
with Dominic Orchard.  Finally, Harley Eades is an active SIGPLAN
Mentor (<https://www.sigplan.org/LongTermMentoring/>) of one PhD
student.

Interested students should meet the following properties:

- Be interested in the overall project as stated above. 

- Have or are about to complete a Bachelor of Science in Computer
  Science or a related field (Computer Engineering, Information
  Systems, Software Engineering, Mathematics, etc.).

- Have a minimum cumulative GPA of 3.0 or better on a 4.0 scale.

- Both national and International applicants are welcome.

If you are interested in applying for this opportunity please begin by
contacting Harley Eades (<harley.eades@gmail.com>) with the following
information:

- A brief introduction of yourself and if you've done any research
  already.

- CV/Resume

More information:

- Harley Eades: <https://metatheorem.org/>
- Granule Project: <https://granule-project.github.io/>
- ForML Lab: <https://the-au-forml-lab.github.io/index.html>
- AU PhD Program: <https://www.augusta.edu/ccs/phd-ccs.php>
                  <https://jagwire.augusta.edu/school-of-computer-and-cyber-sciences-to-offer-new-phd-program/>

## PhD Opportunities with Dominic Orchard at the University of Kent

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

Graded types provide an opportunity to capture program properties at the type level, which
can be used to expose static analysis information to the user. This aids the programmer in reasoning about
their programs, but can also benefit the compiler: the information in
graded types can be used to direct compilation. This project would develop a compiler
for Granule (or a similar language with graded types) that uses the graded type information
to inform optimisations, e.g., leveraging linear types and bounded-reused modalities
to statically de-allocate memory and use mutation where possible, or using security
modalities to change how binaries are compiled to obscure data and data structures. There is already
[an initial LLVM compiler](https://github.com/granule-project/granule-compiler-llvm) which provides a starting point.
An additional, or alternate, project is to push grades into a semantics in order
to verify compiler optimisations at the semantic level. Initial work suggests
that graded structures in semantics (e.g. graded monads and graded comonads) can
allow common optimisations to be proved correct in a unified way at the denotational
level, allowing a new compiler verification technique. There is a lot of work
to be done here.
