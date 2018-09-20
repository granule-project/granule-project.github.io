---
layout: page
mathjax: true
title: Security & Privacy
---

Secure information-flow in Granule
------------------------------




Granule is designed to allow different kinds of property to be tracked
via its type system (see more in [Language](https://granule-project.github.io/granule.html)). One such example is for enforcing _data privacy_ so that
confidentiality can be automatically verified and enforced via the type system.

The type system can be parameterised by a lattice of permissions.  As
with the rest of Granule's property tracking, any quantitative
constraints generated during type checking are discharged via an SMT
solver. This allows arbitrarily complex lattices to be plugged-in to
the compiler without any change to the type checker.

In these examples, we'll just use a simple two-point lattice which is
built-in, which has two values `Public` and `Private`. We can then,
for example, declare a secret as existing only in a private zone:

```
secret :Private: Int
secret = 42
```

The signature here marks the variable `secret` as `Private` only. We
can define operations that work on security-level guarded values,
but which are polymorphic in the level. For example, the following
simulates the idea of having a hash function:

```
hash : forall (l : Level) . Int |l| -> Int |l|     -- at any level...
hash |x| = |(x * x * x)|                           -- ...hash by cubing
```

Then, if we try to write a program that is going to run in a public
context, we cannot inadvertently leak the secret via the hash.
For example, the following is rejected by the compiler:

```
-- Does not type check
main : Int |Public|
main = hash |secret|
```

We get the following error:

```
$ gr examples/Secure.gr

Checking examples/Secure.gr...
Type error: examples/Secure.gr: :16:1:
Definition 'main' is Falsifiable as Private cannot flow to Public
```

All of the tracking is automatically computed by the type system. We can of
course hash the secret in the context of a private program, e.g., the following
is accepted by the type checker:

```
main : Int |Private|
main = hash |secret|
```

#### Data types and privacy

As another more interesting example. Consider the following data type
which capture the idea of a patient record which has a mixture of publicly
accessible and non-public fields:

```
data Patient where
  Patient :
      Int    |Private|   -- Patient id
   -> String |Private|   -- Patient name
   -> Int    |Public|    -- Patient age
   -> Patient
```

Here we want to allow public access to a persons age, but to nothing else.

We can then write the following function which computes the mean age
of a database of patients (represented as a list), which is publicly
accessible:

```
meanAge : List Patient -> Int |Public|
meanAge xs = meanAge' xs |0| |0|

-- Tail-recursive helper
meanAge' : List Patient  -- Patient database
       -> Int |Public|   -- Count
       -> Int |Public|   -- Current age sum
       -> Int |Public|   -- Mean age viewed public
meanAge' xs |total| |n| =
  case xs of
    (Next (Patient |_| |_| |age|) xs) -> meanAge' xs |(age + total)| |(n+1)|;
    Empty -> |(div total n)|
```

Apart from some accounting via the boxing and unboxing operator `|..|` this
is just a regular tail-recursive program. Notably, the `meanAge` function
takes a database (list) of patients and returns a public integer.

If we tried to "sneak" some private information out through this query
or if we wrote a query that exposed some of the patient's private data, then
the type system would reject it, e.g.

```
-- Rejected by Granule compiler
names : List Patient -> String |Public|
names xs =
  case xs of
    (Next (Patient |_| |name| |_|) xs) ->
       let |allNames| = names xs in |(name `stringAppend` allNames)|;

    Empty -> |("")|
```

The full example can be found in the [Examples directory](https://github.com/granule-project/granule/blob/master/examples/Database.gr)

#### What's next

The next step is to allow partial declassification and tracking
of allowed bounded amounts of leakage (e.g., we might allow
the 2 bits of a patient ID to be leaked, but not the rest). We are
working on primitives to allow more fine-grained tracking in this way.
Furthermore, we are working on the interaction of privacy with
Granule's side-effect tracking features.

We are also developing techniques to avoid control flow attacks.

At this point, Granule is a _core_ language for experimenting with
fine-grained resource reasoning via graded modal types (the things
wrapped in `|..|`). We have a companion surface-level language in
development which makes these type implicit, so that programs resemble
standard functional programs even more closely. This will then desguar
into the Granule core language in the compiler.