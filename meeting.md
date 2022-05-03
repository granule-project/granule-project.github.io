---
layout: page
mathjax: true
title: Meeting
---

Meeting on Graded Types
------------------------

<span style='font-size:larger'>17th June 2022 - School of Computing, University of Kent (+ online)</span>

Graded type systems can be understood broadly as
 imbuing type systems with additional information that follows the underlying structure of a program or proof.
This idea has grown considerably in recent years with various forms of graded type system being developed, for example, from generalisations of effect
systems (modelled by graded monads), coeffect systems (modelled by graded comonads), quantitative type theories that generalise ideas from bounded
linear logic, graded modal systems, contextual modal type theory, capability tracking systems, graded session types, adjoint logic and multi modal systems.
In practical settings, graded type systems are becoming more prevalent, e.g., Granule, Idris 2, Haskell (via the LinearTypes extension).

The aim of this meeting is to bring together a wide variety of researchers working on such concepts across programming language theory and practice to report on latest work and share ideas. The hope is that this can be a pre-cursor to future such meetings, e.g., a Dagstuhl seminar.

### Schedule

This is a hybrid event. You can attend in person or online. On Thursday afternoon, there is a separate
but related event running, hosted by David Corfield, that all are welcome to attend as part of this:

- **Thursday 16th afternoon - 1-5pm - Grading in Philosophy, Linguistics and Computer Science**

   [Further details of this workshop](http://128.2.67.219/davidcorfield/show/Graded+Modalities)

    - **Linguistic targets for graded modalities**
      [Daniel Lassiter](http://web.stanford.edu/~danlass/) (University of Edinburgh)

    - **Graded Modal Types for Fine-grained Program Reasoning**
      [Dominic Orchard](https://granule-project.github.io) (University of Kent and University of Cambridge)

    - **Graded modalities and dependent type theory**
      [David Corfield](https://www.kent.ac.uk/philosophy/people/1689/corfield-david) (University of Kent)
    
- **Friday 17th - Meeting on Graded Types**

    - **A Mixed Linear and Graded Logic**, [Harley Eades](https://metatheorem.org/), (Augusta University) 
    - **Beyond semirings** [James Wood](https://personal.cis.strath.ac.uk/james.wood.100/), (University of Strathclyde)
    - **Graded Types For Extensible Dynamic Natural Language Semantics** [Jean-Philippe Bernardy](https://jyp.github.io/) (University of Gothenburg)
    - **Effects, capabilities, and boxes: from scope-based reasoning to type-based reasoning and back**, [Jonathan Brachthäuser](http://ps.informatik.uni-tuebingen.de/team/brachthaeuser/) (University of Tübingen)
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

    - **TBD**, Pritam Choudhury (University of Pennsylvania)
    - **TBD**, [Dylan McDermott](https://dylanm.org/) (University of Reykjavik)
    - **TBD**, [Edwin Brady](https://www.type-driven.org.uk/edwinb/) (University of St. Andrews)
    - **TBD**, [Andrew Hirsch](https://akhirsch.science/) (Max Planck Institute)

    - And a session of shorter talks (10 minutes)

Schedule TBD, but likely to last most of the day. 

### Signing up and attending in person

- [Sign up here](https://forms.gle/yYPp7kodQ8478nSZA)
- Please tick 'In person' if you would like to attend in person on the form.
- The School of Computing at the University of Kent is [about 30 minute walk from Canterbury West station](https://www.google.com/maps/dir/canterbury+west/Cornwallis+South+East+(Octagon),+University+Of+Kent,+St+Stephen's+Hill,+Canterbury+CT2+7NL/@51.2914835,1.0652968,15z/data=!3m1!4b1!4m14!4m13!1m5!1m1!1s0x47decbb6b38183cb:0x578821196fcdcd35!2m2!1d1.07533!2d51.28427!1m5!1m1!1s0x47decba874d2f7c7:0x6d4d3c9d25aaf5da!2m2!1d1.07126!2d51.2988783!3e2?hl=en), which is a bit less than an hour on the train from St. Pancras
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
