A quick review for CSCI-344 (Programming Language Concepts)


# Ch #1 What are Programming Languages

## Types

### Imperative

Most common type of language

- Von Neumann (Fortran, Basic, C)
- Object-oriented (SmallTalk, java)
- Scripting (perl, python, basic)

### Declarative

- Functional (Scheme, ML)
- Logical (Prolog)

## Compilation vs Interpretation

Interpretation is more flexible and gives better diagnostics for debugging.
Compilation provides better performance.
Often there is no clear cut difference between compilation and interpretation because many languages like java and python do a mix of the both.

### Compilation

![](media/plcfinal/compilation.png)

### Interpretation

![](media/plcfinal/interpretation.png)


### Mixed

![](media/plcfinal/mixed.png)


### Compilation Overview

![](media/plcfinal/compOverview.png)


# Ch #2 Parsing

## Context-Free Grammars

We use CFGs to produce a parse tree from tokens.

![](media/plcfinal/cfgEx.png)

## LL Grammar

LL(1) grammar means that it is left right left most derivation parsing with one token look ahead.
In practice we would use a stack to keep track what we expect to see.
In this approach we would build the tree top down.
The LL parsing algorithm uses FIRST/FOLLOW/PREDICT tables.

Ex grammar:

![](media/plcfinal/ll.png)

## LR Grammar

LR (Left to right right most derivation) builds the tree bottom up and is almost always table driven.


## Scanning

A scanner is responsible for tokenizing the source, removing comments, saving text of identifiers, and saving line locations for error messages.
A scanner is most naturally represented as a DFA (Deterministic Finite Automaton).

![](media/plcfinal/scanner.png)

# Ch #10 Object Oriented

Three major OO Components:

- Encapsulation
- Inheritance
- Dynamic method binding

Strict terms for OO lang: everything is an object, inheritance, dynamic method binding.
Since java has primitives, it is not a true OO language. 


## Small Talk

Started as a thesis project in the 1960's, has been noted as being one of the best OO language historically. 

Basic coding examples on class-inheritance and constructors may be on exam.

### Syntax

Excessively uses parenthesis.
Method calls are in the form: (function:: object parameter1 parameter 2).
NOTICE: the colons in the function name represents how many parameters it has.
Also, there are no commas between parameters.



Basic example class. 

```scheme
(class Shape Object
    (perimeter area) ; class-level parameters
    
    ;constructor
    (class-method initalize::shape (per ar)
        (init::shape (new self) per ar)
    )

    (method init::shape (per ar)
        (setPerimeter: self per)
        (setArea: self ar)
        self
    )

    (method getPerimeter () 
        perimeter
    )
    
    (method getArea () 
        area
    )

    (method setArea: (a)
        (set area a)
    )

    (method setPerimeter: (p)
        (set perimeter p)
    )
)

(val shape1 (initalize::shape Shape 12 5))

; area
(getArea shape1)
(setArea: shape1 88)
(getArea shape1)
```


Example with inheritance:

```scheme
(class Circle Shape
    (radius)

    (class-method initalize:circle (rad)
        (init:circle (new self) rad)
    )

    (method init:circle (rad)
        (setRadius: self rad)
        self
    )

    (method setRadius: (rad)
        (set radius rad)
        (setArea: self (computeArea self))
        (setPerimeter: self (computePerimeter self))
    )

    (method getRadius ()
        radius
    )

    (method computeArea ()
        (* 
            (asFloat (/ 22 7)) 
            (asFloat (squared radius))
        )
    )

    (method computePerimeter ()
        (* 
            (asFloat 2) 
            (* 
                (asFloat (/ 22 7)) 
                (asFloat radius)
            )
        )
    )
)


(val circle1 (initalize:circle Circle 5))
(getRadius circle1)
(getArea circle1)
(getPerimeter circle1)

(setRadius: circle1 6)
(getRadius circle1)
(getArea circle1)
(getPerimeter circle1)
```

# Ch #3: Name, Scope, and Binding

A name is a identifier. A binding links a name to an item.
Scope is simply when a binding is active.


# Binding

Binding typically happens at two times:
- Static: before run time
- Dynamic: at run time.

The earlier the binding the greater efficiency you have. The later the binding the greater flexibility you have.

Static scope rules use the structure of the program.
Dynamic scope rules depends on the current state of the program so, the function call sequences can change which bindings are active.

# Lifetime

Key events:

- creation of object
- creation of binding
- references to variables (uses binding)
- deactivation of binding (leave function stack)
- reactivation of bindings
- destruction of bindings
- destruction of object

If object out lives its binding it's garbage.
If binding out lives its object it's a dangling reference.

# Ch #4 Semantic Analysis

The role of semantic analysis is to enforce semantic rules and generate a syntax tree(decorate the parse tree).
To do this we use a attribute grammar.

ex attribute grammar:

![](media/plcfinal/attributeGrammar.png)

## S-Grammar:

Only uses synthesized attributes: the grammar above.

![](media/plcfinal/sgrammar.png)

## L-Grammar:

A l attribute depends on things above them or besides them in the parse tree.

![](media/plcfinal/lgrammar.png)

## Action Routines

Functions used to interleave the parser.


# Ch #11: Functional Programming

Examples:
- Lisp
- Scheme
- FP
- ML
- Haskell

Key Ideas:
- everything is done by composing functions
- no mutable state
- no side effects
- just produces a answer/result

Necessary Features:
- first class and high-order functions (takes in/returns functions)
- polymorphism
- powerful list functionality
- structured function returns
- fully general aggregates
- garbage collection

Since there is no state, it heavily relies on recursion to replace iteration.

## Scheme

Not purely functional because it has some imperative stuff like assignment, I/O, sequencing and IO

Scheme scopes:
- let: calculates all RHS and then assign, can't use prior ones
- let*: evaluates and then assigns
- letrec: evaluates and then assign, this will loop back to fill in missing pieces as they are declared


### Scheme Examples:

Note: cdr is tail of list and car is the first element in the list.

```scheme
; Computes length of list
(define (length lst)
  (if (null? lst)
     0
     (+
       1
       (length (cdr lst))
     )
  )
)


; determines if something is in the list
; returns:
;   1 if true(in list)
;   0 if not in list
(define (inList lst n)
 (if (null? lst)
     0
     (if (= n (car lst))
         1
         (inList (cdr lst) n)
     )
 ) 
)

; finds the sum of the list
(define (sumList lst)
  (if (null? lst)
      0 ; empty list
      (+
         (car lst)
         (sumList (cdr lst))
      )
  )
)
```

# Ch #6: Control Flow

Types of iteration:
- Sequencing: specifies a linear ordering on statements
- Selection: selects a section of code ie: if statements
- Iteration: for loops, iterates over a well-defined set
- Concurrency
- Exception Handling
- Non-determinacy


Orthogonality: feature can be used in any combination and the meaning is consistent.


# Ch #7: Data Types


Data types are a collection of values from a "domain".
Data types specify the structure of the data and a collection of well-defined operations you can perform on that type.
Data types are useful for implicit context and so that we can avoid meaningless operations.

Strong typing is when language prevents on data that is not appropriate.

Static typing is strong typing that the compiler can do.

Orthogonality: no restriction on how a collection of features can be combined: like python lists.

## Type Systems

A type system has rules for the following:
- type equivalence
- type compatibility: can type A be used in context of type B
- type inference: type of expression given its operands types

## Type Checking

Two major types:
- Structural Equivalence: based on memory layout to determine if same -- can result in unintended equivalencies
- Name equivalence: based on declaration type -- most common

## Coercion

When an expression of one type is used in the context of another. Implicit coercion is when the language does it. 
Explicit is when the programmer does it (Casting).

# Ch #12: Logical Programming

Logical programming is based on predicate calculus.

Important concepts:
- Axioms: facts assumed true in knowledge base
- Theorems: things that are provably true
- Hypotheses: things or queries we would like to prove
- ATOM is a constant like a number

Within logical languages, statements can be written many ways.
Logical languages are good for people but bad for people.
Prolog uses backwards chaining to prove things true mathematically.


A horn clause contains a HEAD and a BODY, sll statements must be in this term. The head is a single term, but, the body can be a list of terms.

## Prolog Ex

```prolog
path(b, f, 6).
path(g, f, 3).
path(e, g, 2).
path(h, g, 4).


% makes paths bi-directional
biPath(A, B, Y) :- path(A, B, Y).
biPath(A, B, Y) :- path(B, A, Y).

% X is starting point
% Y is ending point
% P is a list of the points on the final path if one exists
% N is the distance between X and Y if one exists

% rule for terminal
solveV(X, X, [X], 0, V).

% recursively build out path
solveV(A, B, [A|P], N, V) :- biPath(A, C, CC),
                             \+member(C, V),
                             solveV(C, B, P, CCC, [C|V]),
                             N is CC + CCC.

% expand given definition to helper function
solve(A, B, P, N) :- solveV(A, B, P, N, [A]).

% ex test runs in interpreter
solve(h, c, P, N).
solve(a, e, P, N).
solve(g, c, P, N).
solve(a, a, P, N).
solve(g, h, P, N).
```

# Ch #8: Composite Types

Types:
- Records (Structures)
- Arrays
- Strings
- Pointers
- Lists
- File I/O

## Garbage Collection

Problem with reference counter for garbage collection:

![](media/plcfinal/counter.png)

Mark and Sweep solution:

- Garbage collector walks heap basically marks everything as useless
- starts at outside pointers marking everything it can get to as useful
-walks the heap again placing useless items in the free queue.


## Pointers

### Tombstones

Costly way of dealing with pointers references.
This will create an additional object to maintain the pointer.

![](media/plcfinal/rip.png)


### Lock and Keys

Makes sure that pointers and pointe contains the same lock value before you dereference the object.
Note: this does not prevent attempting to use memory outside of your block resulting in a seg fault.

![](media/plcfinal/lock.png)


# Ch #13



# Ch #14

