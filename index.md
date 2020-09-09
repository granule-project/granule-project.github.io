---
layout: start
title: The Granule Project
---

<a href="https://github.com/granule-project/granule"><img style="position: absolute; top: 0; right: 0; border: 0;" src="https://camo.githubusercontent.com/652c5b9acfaddf3a9c326fa6bde407b87f7be0f4/68747470733a2f2f73332e616d617a6f6e6177732e636f6d2f6769746875622f726962626f6e732f666f726b6d655f72696768745f6f72616e67655f6666373630302e706e67" alt="Fork me on GitHub" data-canonical-src="https://s3.amazonaws.com/github/ribbons/forkme_right_orange_ff7600.png"></a>

The Granule project is an ambitious research project whose focus is to
capture more and more _intensional_ properties of programs at the
type-level, that is, how a program computes not just what it computes.
Our primary mechanism for doing this is via the relative new notion of
_graded types_ in concert with other typing mechanisms like linear
types and dependent types. For example, graded modal types can be
combined with linear types to make resource sensitivity an integral
aspect of a programming language, precisely enforcing resource usage
throughout the language. Other examples include capturing fine-grained
information about side effects, data use, privacy levels, cost, and
permissions via various kinds of (co)effect types captures via graded
modal types.

Our project spans theoretical and practical work.
We are actively developing a prototype implementation of
language with graded, linear, and indexed types called
[Granule](/granule.html) based on our research.  In addition, we are
developing a new [dependent type theory]() that will greatly expand
the expressive power of Granule's type system.  For more information
about our current research directions please read this series of [blog
posts]().

## News

- __September 2020__ <span class='paper'>paper</span> Jack and Dominic have a new paper about program synthesis with linear and graded modal types in Granule accepted to [LOPSTR 2020](https://nms.kcl.ac.uk/maribel.fernandez/LOPSTR2020/),
entitled "__Resourceful Program Synthesis from Graded Linear Types__". The version from the pre-proceedings can be found [here](http://granule-project.github.io/papers/LOPSTR_2020_paper_pre_proceedings.pdf). This paper won the <ul>LOPSTR 2020 Best Paper Award</ul>. <br
style="display:block;margin-bottom:30px;line-height:30px;font-size:30px;"
/><br />

- __June 2020__ The Granule project had three abstracts accepted for presentation at [LINEARITY/TLLA 2020](https://lipn.univ-paris13.fr/LinearityTLLA2020/):

   - Jack Hughes and Dominic Orchard. __Deriving distributive laws for graded linear types__
   - Aubrey Bryant and Harley Eades III. __The Graded Lambek Calculus__
   - Harley Eades III and Dominic Orchard. __Grading Adjoint Logic__

  For full access to each abstract see the [Publications](/research.html) section. <br
style="display:block;margin-bottom:30px;line-height:30px;font-size:30px;"
/><br />

- __April 2020__ <span class='paper'>paper</span> Dominic has a new paper capturing
classical data flow analysis via graded monadic semantics accepted to [FSCD 2020](https://fscd2020.org/),
entitled "Data-flow analyses as effects and graded monads", joint with Andrej Ivašković
and Alan Mycroft. <a
href="https://drops.dagstuhl.de/opus/volltexte/2020/12337/pdf/LIPIcs-FSCD-2020-15.pdf">in
the proceedings here.</a><br
style="display:block;margin-bottom:30px;line-height:30px;font-size:30px;"
/><br />

- __March 2020__ The Granule project is hiring a 2-year post-doctoral researcher to
work at the University of Kent!
[Details of how to apply here](https://jobs.kent.ac.uk/Vacancy.aspx?ref=STM-146-20).
Closing date for applications is Friday 8th May 2020.<br
style="display:block;margin-bottom:30px;line-height:30px;font-size:30px;"
/><br />

- __March 2020__ <span class='paper'>paper</span> We have a new paper on the
relationship between graded monads and parameterised monads accepted
to
MSFP 2020. [Preprint available online](https://arxiv.org/abs/2001.10274), updated to the final version soon.
