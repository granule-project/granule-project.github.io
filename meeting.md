---
layout: page
mathjax: true
title: Meeting
---

Meeting on Graded Types
------------------------

<style>
 li {
  margin-top: 0.5em;
  margin-bottom: 0.5em; 
 }
</style>

<span style='font-size:larger'>17th June 2022 - School of Computing, University of Kent (+ online)</span>

Graded type systems can be understood broadly as
 imbuing type systems with additional information that follows the underlying structure of a program or proof.
This idea has grown considerably in recent years with various forms of graded type system being developed, for example, from generalisations of effect
systems (modelled by graded monads), coeffect systems (modelled by graded comonads), quantitative type theories that generalise ideas from bounded
linear logic, graded modal systems, contextual modal type theory, capability tracking systems, graded session types, adjoint logic and multi modal systems.
In practical settings, graded type systems are becoming more prevalent, e.g., Granule, Idris 2, Haskell (via the LinearTypes extension).

The aim of this meeting is to bring together a wide variety of researchers working on such concepts across programming language theory and practice to report on latest work and share ideas. The hope is that this can be a pre-cursor to future such meetings, e.g., a Dagstuhl seminar.

### Schedule

This is a hybrid event. You can attend in person or online. All times listed refer to the local time in Canterbury, or in other words the [UTC+1](https://time.is/UTC+1) timezone. On Thursday afternoon, there is a separate
but related event running, hosted by David Corfield, that all are welcome to attend as part of this:

- **Thursday 16th afternoon - 1-5pm - Grading in Philosophy, Linguistics and Computer Science**

   [Further details of this workshop](https://ncatlab.org/davidcorfield/show/Graded+Modalities)

    - **Linguistic targets for graded modalities**
    
      [Daniel Lassiter](http://web.stanford.edu/~danlass/) (University of Edinburgh)

    - **Graded Modal Types for Fine-grained Program Reasoning**
    
      [Dominic Orchard](https://granule-project.github.io) (University of Kent and University of Cambridge)

    - **Graded modalities and dependent type theory**
    
      [David Corfield](https://www.kent.ac.uk/philosophy/people/1689/corfield-david) (University of Kent)
    
- **Friday 17th - Meeting on Graded Types**

     - 09:30 - *Opening remarks*, Dominic Orchard

     - 09:40 - **Giving Semantics to Program-Counter Labels via Secure Effects** 
       <div class="abstract">Graded monads have been particularly successful in enforcing information-flow security and giving semantics to type-and-effect systems. However, works on information-flow security reason about effects no using a graded monad, but using special labels known as "program-counter labels." This work explores how program-counter labels interact with graded monads for effects, by showing that program-counter labels indeed have semantics as effects. Thus, we see that the ad-hoc reasoning about effects in information-flow circles is not so ad-hoc after all. Moreover, by using this semantics we are able to develop a proof technique we call "noninterference half-off." This technique uses the monadic semantics of effects to ensure that program-counter--label manipulations in an information-flow type system correctly ensure noninterference.</div>

       [Andrew Hirsch](https://akhirsch.science/) (Max Planck Institute)

    - 10:10 - **Canonical gradings of monads**
      <div class="abstract"><p>Many of the graded monads that have been used as models of effect systems "look like" graded versions of existing ordinary monads, in that, on each grade, they are given by restricting the monad. This raises the question of whether we can somehow canonically grade a given monad. It turns out that we can. Given a notion of subfunctor, we obtain a notion of grading of a monad, consisting of a collection of grades, and a subfunctor for each grade, forming a graded monad. Under reasonable conditions, every monad has a grading that is canonical (satisfies a particular universal property). I will talk about how this construction works, and demonstrate it with some examples. This is based on joint work with Flavien Breuvart and Tarmo Uustalu.</p></div>
      
      [Dylan McDermott](https://dylanm.org/) (University of Reykjavik)
      
    - 10:40 - *Coffee break*

    - 11:10 - **Beyond semirings**
      <div class="abstract">Semirings have served as the basic algebraic structure for abstracting over usage restriction schemes in most of our work. Addition captures accumulation, while muliplication captures modality. However, in certain settings we feel either that we can't find the right semiring (for example, to yield multiplicative-additive linear logic) or that the semiring operations are not quite the ones we want (for example, when doing type-checking in the presence of additive units). In this talk, I will present both positive and negative results about semiring-like structures we may want to explore. </div>

      [James Wood](https://personal.cis.strath.ac.uk/james.wood.100/), (University of Strathclyde)
 
    - 11:40 - **Graded Types For Extensible Dynamic Natural Language Semantics**
      <div class="abstract"> Research in dynamic semantics has made strides by studying various aspects of discourse in terms of computational effect systems, for example, monads (Shan, 2002; Unger, 2011; Charlow, 2014), continuations (de Groote, 2001; Barker and Shan, 2014), and general effect handlers (Maršik, 2016). We provide a system, based on graded monads, that synthesizes insights from these programs by formalizing individual discourse phenomena in terms of separate effects, or grades. Included are effects for introducing and retrieving discourse referents, non-determinism for indefiniteness, and generalized quantifier meanings. We formalize the behavior of individual effects, as well as the interactions between effects, in terms of algebraic laws tailored to the relevant discourse phenomena. The system we propose is thus modular and suggests a novel approach to integrating formal accounts of distinct semantic phenomena. Finally, we give an interpretation of the system into pure λ-calculus that respects the laws. Future work will aim to integrate more discourse phenomena using the same methodology, for example, presupposition and conventional implicature.</div>

      [Jean-Philippe Bernardy](https://jyp.github.io/) (University of Gothenburg)

    - 12:10 - *Lunch*

    - 13:30 - **Effects, capabilities, and boxes: from scope-based reasoning to type-based reasoning and back**
      <div class="abstract">Reasoning about the use of external resources is an important aspect of many
practical applications. Effect systems enable tracking
such information in types, but at the cost of complicating signatures of
common functions. Capabilities coupled with escape analysis offer
safety and natural signatures, but are often overly coarse grained and restrictive. We present SystemC,
which builds on and generalizes ideas from type-based escape analysis and demonstrates that capabilities and effects can be
reconciled harmoniously. By assuming that all functions are _second class_, we can
admit natural signatures for many common programs. By introducing a notion of
_boxed values_, we can lift the restrictions of second-class values at the cost of
needing to track degree-of-impurity information in types. The system we
present is expressive enough to support effect handlers in full capacity. We
practically evaluate SystemC in an implementation and prove its soundness.</div>

      [Jonathan Brachthäuser](http://ps.informatik.uni-tuebingen.de/team/brachthaeuser/) (University of Tübingen)

  - 14:00 - **Idris 2: Quantitative Type Theory in Practice**
    <div class="abstract">Dependent types allow us to express precisely what a function is intended to do. Recent work on Quantitative Type Theory (QTT) extends dependent type systems with linearity, also allowing precision in expressing when a function can run. This is promising, because it suggests the ability to design and reason about resource usage protocols, such as we might find in distributed and concurrent programming, where the state of a communication channel changes throughout program execution.  Idris 2 is a new version of the dependently typed language Idris, with a new core language based on QTT, supporting linear and dependent types, which allows us to experiment with these ideas. I will describe Idris 2, and how QTT has influenced its design, giving examples of QTT in practice. Further, I will describe some limitations of QTT as implemented in Idris 2, which we would like to address in future work.</div>

      [Edwin Brady](https://www.type-driven.org.uk/edwinb/) (University of St. Andrews)

  - 14:30 - **From Ungraded to Graded: A Historical Perspective on Linear Type Systems** 
      <div class="abstract"><p>In this talk, I shall trace the evolution of linear type systems. The early linear type systems that followed the introduction of linear logic by Girard faced several syntactic problems, particularly with regard to substitution. The main reason behind these problems was their ungraded nature. Such systems implicitly assumed that every contextual assumption is linear in nature, thereby modelling non-linear assumptions as linear !-assumptions. This modelling came with a price --- in these systems, the promotion rule does not commute with substitution. To address this problem, later systems baked substitution directly into the promotion rule. But that made their promotion rule quite complicated. Soon it was realized that a graded presentation of a linear type system can be simpler and more elegant. Two such graded linear type systems were introduced in quick succession --- Linear/Nonlinear Lambda-calculus by Benton and Dual Intuitionistic Linear Logic by Barber. These systems split contexts into two zones, one containing linear assumptions and the other containing nonlinear ones. With this grading of contexts, these systems did away with the syntactic problems their earlier counterparts faced. </p><p>Benton's and Barber's systems are graded; however, the grades are tightly coupled with the contextual zones in these systems. While this coupling does not present any problem in simple linear type systems, it becomes a limiting factor in the design of dependent linear type systems. So for a long time linear types and dependent types didn't see eye to eye. </p><p>Meanwhile, progress was being made in the design of general graded type systems for tracking coeffects. Coeffects, of which linearity is but an example, model how computations depend upon their contexts. A distinguishing feature of these coeffect-tracking systems is that they represent coeffects using elements of an abstract semiring and use those elements to grade the contextual assumptions. Instead of dividing the context into graded zones, these systems grade individual assumptions and manipulate those grades via the semiring operations. Such a grading mechanism allows an assumption to appear at different grades in typing rules with two or more premise judgments; something that would be quite difficult to allow with zoned contexts. This flexibility provided by general graded type systems set the stage required for the design of a dependent linear type system. </p> <p>However, a final breakthrough was necessary: the realization that 0 can be used as a placeholder to mark assumptions that cannot be `consumed'. McBride provided this final breakthrough and integrated  linear types and dependent types in an elegant manner. In fact, he went further by treating 0 as a number in its own right, thereby enabling a simultaneous analysis of irrelevance in his linear dependent type system. McBride's system inspired the design of several linear dependent systems, notably QTT, GraD, Grtty, etc. and is a topic of ongoing research. His system also forms the basis of run-time irrelevance analysis in Agda and linearity analysis in Idris 2.</p><p>This evolution of linear type systems parallels the evolution of numbers in human history. First, there was just a number-sense. Then came the numbers, but they were tightly connected to physical objects like notches on bones, knots on strings, beads on abacus, etc. Finally, people learned to see numbers abstractly. This final breakthrough was made possible, in part, by the positional numeral system and the discovery of 0, first as a placeholder and then as a number in its own right.</p></div>

      Pritam Choudhury (University of Pennsylvania)
      
  - 15:00 - *Coffee break*
     
  - 15:30 - **A Mixed Linear and Graded Logic**
      <div class="abstract">Benton showed in his seminal paper on Linear/Non-Linear logic and models that the of-course modality of linear logic can be split into two modalities connecting intuitionistic logic with linear logic forming a symmetric monoidal adjunction. In this paper, we give a similar result showing that graded modalities can be split into two modalities connecting graded logic with linear logic.  We propose a sequent calculus, its proof theory and categorical model, and a natural deduction system in the form of a term assignment system which is shown to be isomorphic to the sequent calculus.  One interesting aspect of our system is it can be seen as Linear/Non-Linear logic composed with an action that adds the grading.</div>

      [Harley Eades III](https://metatheorem.org/), (Augusta University)
     
  - 16:00 - __Short talk session__
  
      - 16:00-16:15 - **Unifying models of linear/graded dependent types** [Bob Atkey](https://bentnib.org/)
      - 16:15-16:30 - **Gradual Typing for Effects & Handlers** [Max New](https://maxsnew.com/)
      - 16:30-16:45 - **Grading Digital Circuits** [Jan de Muijnck-Hughes](https://jfdm.github.io/)
      - 16:45-17:00 - **Graded session types** [Daniel Marshall](https://starsandspira.ls/)
      - 17:00-17:15 - **Program synthesis with linear and graded types** [Jack Hughes](https://www.jackohughes.com/)
      - 17:15-17:30 - **Modal Subtyping for Grade Inference** [Michael Arntzenius](http://www.rntz.net/)
      - 17:30-17:45 - **Weighted Sets and Modalities** [Vikraman Choudhury](https://vikraman.org/)

  - 17:45 - Close

### Signing up and attending in person

- [Sign up here](https://docs.google.com/forms/d/e/1FAIpQLSfaxuhCY47lSUcIgsAESLljhL2xoQU35KFqZULp_7VzCqu0xw/viewform?usp=sf_link) 
- Please tick 'In person' if you would like to attend in person on the form.
- The School of Computing at the University of Kent is [about 30 minute walk from Canterbury West station]([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](https://www.google.com/maps/dir/canterbury+west/Cornwallis+South+%26+South+West,+Canterbury+CT2+7NF,+UK/@51.2930298,1.0662997,15z/data=!4m14!4m13!1m5!1m1!1s0x47decbb6b38183cb:0x578821196fcdcd35!2m2!1d1.07533!2d51.28427!1m5!1m1!1s0x47decba7c6b71b0b:0xe2453d348bfa18a1!2m2!1d1.0701505!2d51.2985459!3e2?hl=en)) in the Cornwallis South building. Canterbury West is a bit less than an hour on the train from St. Pancras
- There is a lot of accommodation nearby if you want to stay overnight. One recommendation is [Acacia Lodge](https://www.acacialodge.co.uk/) (which is near to the train station and again about 30 minutes walk from campus) or the [Beverly Farmhouse](https://www.kent.ac.uk/conferences-and-events/holidays/beverley-farmhouse) (which is on campus).

- Any questions please contact [Dominic Orchard](mailto:d.a.orchard@kent.ac.uk).

    <script>
      //
      var abstracts = document.getElementsByClassName("abstract");
      for (let i=0; i<abstracts.length; i++){
	  abstracts[i].style.display = "none";
	  let showButton = document.createElement("span");
	  showButton.innerHTML = "(abstract)";
	  showButton.addEventListener("click", function() {
	      if (abstracts[i].style.display == "none") {
		  showButton.innerHTML = "(hide)";
		  abstracts[i].style.display = "";
	      } else {
 		  showButton.innerHTML = "(abstract)";
		  abstracts[i].style.display = "none";
              }
	  });
	  showButton.className = "showButton";
	  abstracts[i].parentNode.insertBefore(showButton, abstracts[i]);
      }
    </script>
