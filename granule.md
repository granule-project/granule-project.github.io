---
layout: page
mathjax: true
title: Language
---

The Granule Language
--------------------


#### Installation

Granule can be downloaded from [Github](https://github.com/granule-project/granule) and built and installed via [stack](https://docs.haskellstack.org/en/stable/README/).  Please see the [README](https://github.com/granule-project/granule/blob/master/README.md) for further instructions.

#### Why Granule?

Many modern programs are resource sensitive, that is, the amount of resources (e.g., energy, bandwidth, time, memory), and their rate of consumption, must be carefully managed. Furthermore, many programs handle sensitive resources, such as passwords, location data, photos, and banking information. Ensuring that private data is not inadvertently leaked is as important as the functional input-output behaviour of a program.

Various type-based solutions have been provided for reasoning about and controlling resources. A general class of program behaviours called coeﬀects has been proposed as a uniﬁed framework for capturing different
kinds of resource analysis in a single type theory [[Petricek et al.](http://tomasp.net/academic/papers/structural/coeffects-icfp.pdf), [Petricek et al.](http://tomasp.net/academic/papers/coeffects/coeffects-icalp.pdf), [Brunel et al.](https://lipn.univ-paris13.fr/~mazza/papers/CoreQuantCoeff.pdf), [Gaboardi et al.](https://www.cs.kent.ac.uk/people/staff/dao7/publ/combining-effects-and-coeffects-icfp16.pdf), [Ghica et al.](https://www.cs.bham.ac.uk/~drg/papers/esop14.pdf), [Breuvart et al.](https://lipn.univ-paris13.fr/~breuvart/articles/boundedRel.pdf)]. Recently it has been shown how coeﬀect types can be integrated with eﬀect types for resource reasoning with eﬀects [[Gaboardi et al.](https://www.cs.kent.ac.uk/people/staff/dao7/publ/combining-effects-and-coeffects-icfp16.pdf)].

To gain experience with such type systems for real-world programming tasks, and as a vehicle for further research, we are developing **Granule**, a functional programming language based on the linear λ-calculus augmented with graded modal types, inspired by the coeffect-effect calculus of [Gaboardi et al.](https://www.cs.kent.ac.uk/people/staff/dao7/publ/combining-effects-and-coeffects-icfp16.pdf). A full description of Granule can be found in our recent ICFP 2019 paper (https://www.cs.kent.ac.uk/people/staff/dao7/publ/granule-icfp19.pdf).

#### Graded Modal Type Theory

A graded modality is an indexed family of modalities with some additional structure on the indices which mirrors the structure of the axioms/proof rules. For example, the exponential modality of linear logic $$!$$ has a graded counterpart in Bounded Linear Logic [[Girard et al.](https://www.sciencedirect.com/science/article/pii/030439759290386T)], where $$!$$ is replaced with a family of modalities $$!_n$$ indexed by the natural numbers (the reuse bound). The operations of the usual natural number semiring are then used in the axioms/rules of the logic e.g., the transitivity axiom is $$!_{n*m} A \to !_n !_m A$$. There are various different examples in the literature under the name of coeffects which provide ﬁne-grained analysis of resources and context-dependence via graded necessity modalities.

The goal with Granule is to support arbitrary, user-customisable graded modalities to enable fine-grained, quantitative program reasoning. At the moment, there are three built-in modalities: BLL-style resource-bounded graded necessity, a security-lattice graded necessity, and an effect-graded possibility modality for I/O. Type checking is based on a bidirectional algorithm, interfacing with the Z3 SMT solver to discharge constraints.

**Example 1:** Reuse Bounds

The following is a valid Granule program:

```idris
dup : forall {a : Type} . a [2] -> (a, a)
dup [x] = (x, x)
```

This specifies the function `dup` which takes a value and turns it into a pair by duplicating it. The
first parameter is therefore used non-linearly. If we were to try to give this the type `a -> (a, a)` then
the type checker would complain of a linearity violation. Instead, since we are using the parameter
non-linearly, the type above describes this non-linear use via the resource bound `2` attached via
a graded modal type. The type `a [n]` can be read as a boxed value of type `a` which, when unboxed,
can be used `n` times. This type is equivalent to $$!_n \text{a}$$ in [Girard et al.’s](https://www.sciencedirect.com/science/article/pii/030439759290386T) notation. The pattern match `[x]` discharges the incoming modality and binds `x` as a non-linear variable.

Let's see a bit more of Granule, where the grading is made polymorphic:

```idris
twice : forall {a : Type, b : Type, c : Nat} . (a [c] -> b) [2] -> a [2 * c] -> (b, b)
twice [g] [x] = (g [x], g [x])

main : ((Int, Int), (Int, Int))
main = twice [dup] [1]
```

Looking at the type signature for twice, we can deduce that it is a higher-order function: its ﬁrst parameter is a unary function whose parameter is used non-linearly exactly `c` times and which returns a `b`. The second parameter of `twice` is used non-linearly exactly `2 * c` times, since `g` uses `c` copies of its first parameter and is applied twice. This example shows Granule's support of coeffect polymorphism.

So far these examples have been a little trivial. Let's see something more interesting that mixes
the linearity + graded modality idea with indexed types. Granule provides indexed types such as
sized-indexed vectors. This enables the following definition for `map` on vectors:

```idris
map : forall {a : Type, b : Type, n : Nat} . (a -> b) [n] -> Vec n a -> Vec n b
map [_] Nil = Nil;
map [f] (Cons x xs) = Cons (f x) (map [f] xs)

```

The type parameter `n` is of type `Nat` which is the type of natural numbers and `(a -> b) [n]` is the type
of a function that must be used exactly `n` times.
Thus, this type says that we must use the parameter function exactly the number of times as the length
of the incoming vector. This significantly cuts down the number of possible implementation of `map`
to only the one above, modulo permutation of the elements. In other words: _we get more theorems for free._

**Example 2:** Security Levels

Another modality available in Granule is indexed by a two-point security lattice with levels: `Public` and `Private`. For example:

```idris
secret : Int [Private]
secret = [42]                                  -- specified as private

dub : forall {l : Level} . Int [l] -> Int [l]  -- at any level
dub [x] = [x + x]                              -- ...double an int

main : Int [Private]
main = dub secret                              -- double the secret
```

Here `main` is marked as a high-security value (private) via its modal type. The `dub` function appears doubles the integer parameter and its type tracks security levels and is level-polymorphic. It takes an integer at any level `l`, returning a value at the same level. Crucially, the following program is ill-typed:

```idris
leak : Int [Private] -> Int [Public]
leak [x] = [x]                                 -- fails to type check
```

However, we can define a well-typed constant function that discards its high-security value to produce a low-security value by combining resource bounds with security levels:

```idris
notALeak : Int [Private] [0] -> Int [Public]
notALeak [_] = [0]
```

**Example 3:** Eﬀects

A graded possibility modality provides tracking of side eﬀects in the style of a graded monad and eﬀect system. A type `t <e>` describes a computation returning a value of type `t` and producing side eﬀects `e`.

In the following code, input (`read`) and output (`write`) operations to the stdio are tracked:

```idris
echo : () <{Stdin, Stdout}>
echo = let x <- fromStdin in toStdout x

```

Footnote: This page was adopted from this abstract [Orchard and Liepelt](http://www.cs.ox.ac.uk/conferences/fscd2017/preproceedings_unprotected/TLLA_Orchard.pdf).
