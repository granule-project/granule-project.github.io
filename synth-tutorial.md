Program synthesis in Granule - A tutorial
=========================================

This tutorial introduces the features of a basic program synthesis tool of Granule for automatically generating
programs from linear and graded modal types. Please refer to our [LOPSTR 2020 paper _Resourceful program 
synthesis from graded linear types_](https://granule-project.github.io/papers/LOPSTR_2020_paper_pre_proceedings.pdf) (pre-proceedings version) for more details if you are interested in the theory and implementation of the synthesis tool.

Installation
------------

First, you'll need to install Granule. You can find the guide to installing the
latest realease of Granule [here](https://github.com/granule-project/granule#installation).

We recommend using [VS Code](https://code.visualstudio.com/) along with the
[Granule VS Code extension](https://github.com/granule-project/granule-vscode-extension). This
tool has several useful shortcuts for Granule, including synthesis. 

See the [documentation](https://github.com/granule-project/granule#running-the-interpreter)
on how to use the interpreter. If you are new to Granule, then we recommend going through the 
[Granule tutorial](https://github.com/granule-project/granule/blob/master/examples/intro.gr.md).

The synthesis functionality covered in this tutorial is still very much a work
in progress so please do raise an [issue](https://github.com/granule-project/granule/issues) if
something doesn't behave as expected.

First steps
-----------

Now let's see how we can synthesise programs from linear and graded modal types!
Let's begin with a simple example, which shows how linearity and graded modalities affect our ability to synthesise programs. 
Say we want to write a function which takes some input of type `a` and simply duplicates it, producing a
pair of values of type `a`. We can start writing this function in Granule by giving the type, like so:

~~~ granule
copy : ∀ a . a → (a × a)
copy = ?
~~~

Here, the `?` represents a "hole" in place of an implementation. The synthesis tool can be invoked on this hole and will 
attempt to fill it based on the type
we've given for `copy`. Place the cursor over and use the keyboard shortcut `Ctrl-e Ctrl-e` (from the Granule
VS Code extension) to synthesise. For the type we've given for `copy`, what should we expect the result to be? 

... there isn't one! This is because the type we gave for `copy` is uninhabited. Remember, Granule uses a linear type system, where 
values must be used exactly once. In `copy`, we use `a` twice, violating linearity. This means that we cannot synthesise an implementation
for this version of `copy`. Here we see an example of where synthesis can help guide the design of our programs: the failure to synthesise a 
program suggests that there may be something wrong with out type! 

We can fix the type of `copy` through the use of a graded modal type. Consider the type of `copy'` below:

~~~ granule
copy' : ∀ a . a [2] → (a × a)
copy' = ?
~~~

Our input `a` is now _graded_ by 2, drawing from the natural numbers semiring for tracking
exact usage of values inside a program. We still don't have an implementation, so we've put
another hole `?`. We can now synthesise an implenetation for `copy'` by pressing `Ctrl-e Ctrl-e`, giving us:

~~~ granule
copy' : ∀ a . a [2] → (a × a)
copy' [y] = (y, y)
~~~

Success! The hole has been replaced by a program which adheres to the type of `copy'`. By pattern matching on
the input value (of type `a [2]`), we obtain a value `y` which we have the capability to use exactly twice, which we use up by
using them to construct a pair. Here we have seen a really simple example of synthesis with linear and graded modal types. In the next section,
we'll build on this to synthesise more complex programs using different semirings available in Granule.

More synthesis
-------------- 

### What can we synthesise? 

At the moment, synthesis is still in a proof-of-concept state in Granule. Consequently, the synthesis tool can only be used on a subset of the 
full Granule language. This will change very soon, however, so stay tuned!

So what types can we use in synthesis? We have already seen that we can use linear function types (`→`), product types (`×`), and graded modal types. In addition
to these we can also synthesise from unit types (`()`) and sum types. To synthesise with sum types, we either have to import the `Either` data type from the Granule standard library by `import Either` at the start of our Granule file, or re-implement the data type in the file itself:

~~~ granule
data Either a b where Left a | Right b
~~~

Note that currently the synthesis tool is hardcoded to use the above type and constructor names for sum types!

### Synthesising with other semirings

#### Intervals

Now that we know what types we can synthesise from, let's take a look at some of the other graded modalities that we can use.
We've already seen the natural numbers semirings for tracking exact usage of values in our example for `copy'`. But sometimes, we need more
flexibility and the ability to approximate usages of values inside a program. This is where the **intervals** semiring is useful. Interval graded modalities
have the form `[x..y]`. where `x` represents a lower bound on usage and `y` an upper bound. For example, if we had a value graded by the interval `[2..4]`, then we have to use it at least twice, and anywhere up to four times. Let's incorporate what we've learned about the types we can use in synthesis with this new semiring to synthesise a function that eliminates a sum type. In this semiring, our graded modalities will be drawn from intervals over the natural numbers:

~~~ granule
import Either

sumElim : ∀ a, b, c . Either a b → (a → c) [0..1] → (b → c) [0..1] → c
sumElim = ?
~~~

Here, we have an input type `Either a b` and we want to end up with something of type `c`. 
We have two additional functions as inputs with types `(a → c) [0..1]` and `(b → c) [0..1]`, both of 
which are graded by `[0..1]`. This means we can use each of these functions either once or not at all. 
Using the synthesis tool, we get an implementation for this function:

~~~ granule
import Either

sumElim : ∀ a, b, c . Either a b → (a → c) [0..1] → (b → c) [0..1] → c
sumElim (Left x) [u] [v] = u x
sumElim (Right y) [u] [v] = v x 
~~~

Pattern mathing on the cases of the `Either`, we simultaneously unbox the two auxilliary functions, allowing us to use them as their interval grades permit. 
For the two sum type constructors, `Left` and `Right`, we then apply the relevant function to get something of type `c` as our result. The interval grades are
required here because we only use one of the functions in each branch, so we need to have the capability to discard them for the branch where they are not used.  

#### Arbitrary semirings

Up until now we have been synthesising programs from types using graded modalities which draw from one of Granule's built-in semirings. However, we can go further that this! As well as being able to synthesise programs from types which have multiple semirings in the same type, we can also synthesise programs from types which are polymorphic in their semiring. Let's take a look at an example: 

~~~ granule

push : ∀ a, b : Type, s : Semiring, c : S . (a × b) [c] → (a [c] × b [c])
push = ?

~~~

From the type of `push`, we can see that it is a function which takes a pair of values graded by grade `c`, drawing from an arbitrary semiring, and returns a pair where the constituent elements of the pair have the same types as the input, except both are now graded by `c`, rather than the whole pair. Synthesing an implentation for `push`, we get the following program:

~~~ granule

push : ∀ a : Type, s : Semiring, c : S . (a × b) [c] → (a [c] × b [c])
push [(x, y)] = ([x], [y])

~~~

Such a function comes in useful when we are composing functions together, whose grades might not match up, requiring us to do some manipulation to make things fit together. For example, imagine we had a function which projects the first element of a pair:


~~~ granule

fst : ∀ a, b : Type . (a × b [0]) → a
fst (x, [y]) = x

~~~

The second element of the pair must be graded by `0`, allowing us to discard it and return only the first element. But say we had a pair of values which is graded by an interval grade `(a × b) [0..1]`, and we wanted to project the first element. We can't use our already defined `fst` function as the types don't match. We could write another version of `fst` specialised to this scenario, but we'd rather not. However, what we can do is _distribute_ the grade of our pair over the pair's constituent elements using the `push`, giving us a pair of type `(a [0..1] × b [0..1])`. We can then simply apply `fst` to this resulting pair as the types now align. Essentially, we have gone from having a pair where we have the capability to use the entire pair `0` to `1` times, to a pair where we can use each constituent element between `0` to `1` times.

This program we synthesised above is an example of a _distributive law_ for product types. We find that such an operation is not uncommon when programming with graded modal types, and that we can actually derive these distributive combinators automatically for most data types. For more information on this, we recommend reading the TLLA-Linearity 2020 paper _Deriving distributive laws for graded linear types_. 

### Synthesising from the command line

So far we have used the `Ctrl-e Ctrl-e` command from the Granule VS Code extension to synthesise 
programs from holes. Alternatively, we can invoke the synthesis tool from the command line via the 
`--synthesise` and `--rewrite-holes` flags when compiling a Granule file using `gr`. For example:

`gr myFile.gr --synthesise --rewrite-holes`

Running the tool this way will attempt to synthesise a program for each hole in the Granule file. The additional flags
`--hole-line` and `--hole-column` can be used to specifiy a specific hole to synthesise a program for, leaving the other holes untouched. For example:

`gr myFile.gr --synthesise --rewrite-holes --hole-line 3 --hole-column 8`

will attempt to synthesise a program for a hole at line 3 and column 8 in `myFile.gr`. If no such hole exists here then the synthesis tool will not be invoked.

### Resource Management

The program synthesis tool presented here is actually paramterised by a _resource management scheme_, which alters the approach that the synthesis algorithm takes
towards managing the available resources it can synthesise programs from. The resource management scheme can have a considerable affect on the efficiency of the synthesis tool. By default, the **additive** approach is used. The **subtractive** approach can be used instead by including the `--substractive` flag when synthesising via the command line. Additionally, there is an alternative additive approach called **additive pruning**, which can be used by including the `--alternate` flag. For further information on resource management, how these schemes work, and the implications they have for performance, we recommend reading the LOPSTR 2020 paper. 

Still to come!
-------------- 

That's it for now! Currently, the synthesis tool is being updated to allow synthesis from arbitrary user defined ADTs/GADTs and to include synthesis of recursive function definitions. We are also working on making the integration of synthesis into Granule more user-friendly.
