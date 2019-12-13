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

## LR Grammar

# Ch #10


# Ch #3


# Ch #4


# Ch #11


# Ch #6



# Ch #7



# Ch #12



# Ch #8


# Ch #13



# Ch #14