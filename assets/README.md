# Preamble notes

## Cross-references

For the sake of contrast and to guide the reader, cross-refs to objects inside
the thesis proper always use long-form (*figure 1*, *equation 2*)
whereas cross-refs to objects in our attached papers use the abbreviated form
(*fig. 4*) in addition to using small-caps and being trailed by the paper
number.
This is configured using `cleveref` macros (see `./assets/preamble/cleveref-settings.Rnw`).

+ https://links.solarchemist.se/shaare/GuXgNw


## Keeping non-text outside the main Rnw files, as much as possible

Stuff like `\includegraphics`, info boxes, etc.

I really need the files that I write in to be primarily text, not R code and
other stuff that distracts from writing.

So, I've decided to put each figure/box etc. into its own file inside `assets/aux/`.
They are included from their place in the parent file using R `child` chunks
(just in case the included file contains any R code).

Side-note for writing in VSCodium:
the LaTeX Workshop extension of VSCodium has a nice feature that allows you
to follow a path inside `\input{...}` just by placing the cursor on it
and pressing `F12`.
To make use of this time-saving feature, I've put a commented-out `input` line
next to each Rnw child chunk.

**Note** If you are working in VSCode Server, this `F12` shortcut only works when
running the browser in "app" mode. In a regular (non-appified) browser window
`F12` (in Chrome, Chromium and Firefox) simply opens the browser's developer view.


## Keeping `\section` commands visible in the VSCodium "Outline"

It is very useful and time-saving to navigate using the Outline functionality
in the VSCodium editor. But the Outline only shows headers that are part of
the currently open file (it does not detect nor follow Rnw children).

But it is also not workable to split the isolated R environments we have created
for each manuscript, and that precludes any way to natively include the section
commands.
This has become an issue now that I've decided to split the Results chapter
into more individual sections (rather than one section == one manuscript).

But I found a work-around by repeating the `\section{...}` commands *inside*
the Rnw chunk, as R comments.
This way, the VSCodium logic picks them up (it ignores commented out LaTeX
code, but luckily it does not check for R's comment character) and it does not
interfere with our R code.

Only downside is that we need to manually maintain correspondence between
those commented out section commands and the actual ones inside each manuscript's
`*-text.Rnw` file.
And one more thing, the R chunk in question will produce a warning in the knitr
output saying
```
In call_block(x) :
  The chunk ... has the 'child' option, and this code chunk must be empty. Its code will be ignored.
```
But I can live with that.



## LaTeX commands to keep in mind and use

| Command         | Example/output   | Defined by...             |
|-----------------|------------------|---------------------------|
| `\Eg`           | Eg               | custom command            |
| `\pH`           | pH               | chemmacros, built-in      |
| `\pOH`          | pOH              | chemmacros, built-in      |
| `\Ka`           | Ka (eq. const.)  | chemmacros, built-in      |
| `\Kb`           | Kb (eq. const.)  | chemmacros, built-in      |
| `\Kw`           | Kw (eq. const.)  | chemmacros, built-in      |
| `\insitu`       | in situ          | chemmacros, built-in      |
| `\exsitu`       | ex situ          | custom                    |
| `\invacuo`      | in vacuo         | chemmacros, built-in      |
| `\abinitio`     | ab initio        | chemmacros, built-in      |
| **`\chemprime`**| '                | chemmacros, built-in      |
| **`\water`**    | H2O              | chemmacros, built-in      |
| `\Oxo`          | H3O+             | chemmacros, built-in      |
| **`\hydroxide`**| OH-              | chemmacros, user-defined  |
| `\HydRad`       | ^.OH             | chemmacros, user-defined  |
| `\hydroxyl`     | OH               | chemmacros, user-defined  |
| `\prt`          | H+               | chemmacros, built-in      |
| **`\proton`**   | H+               | chemmacros, user-defined  |
| `\sld`          | solidus          | chemmacros, built-in      |
| `\lqd`          | liquidus         | chemmacros, built-in      |
| `\gas`          | gaseous          | chemmacros, built-in      |
| `\aq`           | aqueous          | chemmacros, built-in      |
| `\el`           | e-               | chemmacros, built-in      |
| **`\electron`** | e-               | chemmacros, user-defined  |
| **`\hole`**     | h+               | chemmacros, user-defined  |
| `\fplus`        | formal charge +  | chemmacros, built-in      |
| `\fminus`       | formal charge -  | chemmacros, built-in      |
| `\ox{-2,S}`     | arbitrary charge | chemmacros, built-in      |
| `\state{}`      | state function   | chemmacros, built-in      |
| `\enthalpy{}`   | H (enthalpy)     | chemmacros, built-in      |
| `\entropy{}`    | S (entropy)      | chemmacros, built-in      |
| `\gibbs{}`      | G (Gibb's)       | chemmacros, built-in      |
| `\atm`          | atmosphere, unit | chemmacros, built-in      |
| `\cal`          | calorie, unit    | chemmacros, built-in      |
| `\cmc`          | cm3, unit        | chemmacros, built-in      |
| `\molar`        | mol dm-3         | chemmacros, built-in      |
| `\moLar`        | mol L-1          | chemmacros, built-in      |
| **`\Molar`**    | M (smallcaps)    | chemmacros, built-in      |
| `\MolMass`      | g mol-1          | chemmacros, built-in      |
| `\iupac{}`      | chemical names   | chemmacros, built-in      |
| `\cis`          | cis              | chemmacros, built-in      |
| `\trans`        | trans            | chemmacros, built-in      |
| `\tert`         | tert             | chemmacros, built-in      |
| `\bridge{}`     | μ                | chemmacros, built-in      |
| `\hapto{}`      | η                | chemmacros, built-in      |
| `\dento{}`      | κ                | chemmacros, built-in      |
| `\ie`           | i.e.             | custom                    |
| `\eg`           | e.g.             | custom                    |
| `\viz`          | viz.             | custom                    |
| `\etc`          | etc.             | custom                    |
| `\EtOH`         | EtOH             | chemmacros, user-defined  |
| `\zincox`       | ZnO              | chemmacros, user-defined  |
| `\ZnO`          | ZnO              | chemmacros, user-defined  |
| `\ZnAc`         | Zn(OAc)2         | chemmacros, user-defined  |
| `\ZnOAc`        | Zn(OAc)2         | chemmacros, user-defined  |
| `\LiOH`         | LiOH.H2O         | chemmacros, user-defined  |
| `\hematite`     | a-Fe2O3          | custom, also see \gls{Hm} |

For the band gap command, we have both a *symbol* defined in the glossary,
and a custom macro `\Eg{}`. The macro can be used with an empty argument, `\Eg{}`
to typeset only the band gap symbol, but also
accepts a value (`\Eg{1.1}`, producing `Eg=1.1 eV` formatted with siunitx).
Note that the entry in the symbols glossary depends on our custom macro.

For non-resonant Raman modes, use `\nonresmode{E2h}[E2l][long][diff]`.
This macro supports short and long format, as well as sum/diff modes.
Use it!

More custom commands:

+ `\eltr` to typeset elemental electronic transitions (mainly used in XPS).
+ `\Rsq`
+ `\density`
+ `\orcid` to typeset ORCID IDs (for the acknowledgements)



## `\protect` showlabels-generating commands inside captions

So it appears labels or cite or any command generating a showlabel cause
compilation to fail if it happens to be inside a float (table/figure) caption.

Simple fix: always `\protect` the command in question when inside captions!

```
\begin{figure}[tbp]
\centering
<<'fig-mbsolar', ref.label='figref-mbsolar'>>=
@
\caption{Cool caption with a \protect\cref{P1}.}
\label{fig:mbsolar}
\end{figure}
```


## The technical corner

### Custom-defined links and such

Add an external hyperlink using `\hlink{}{}`.
These are collected in a table of links at the end of the document.

Example usage:
```
\hlink{https://github.com/solarchemist/bandgaps}{R package available}
```


To create labels in the margin pointing to more info elsewhere (usually on my blog),
use `\seemore{}`. This command is defined in `assets/preamble/custom.Rnw`.

Example usage (here combined with `hlink`):
```
\seemore{\hlink{https://blog.se/xrays/}{X-rays rocks}}
```


### For reference: the knitr warnings seen on a clean re-compilation

Flushed the cache, then knitted from inside an R session manually, and inspected the `warnings()`.
Like I said, for reference.
Note that most of these warnings appear to be hidden on subsequent knits (once the cache is built).

```
library(knitr)
library(methods)
knit("thesis.Rnw")
warnings()
```

```
> warnings()
Warning messages:
1: Transformation introduced infinite values in continuous y-axis
2: Package ctable Warning:  Transparency disabled: incompatible with tikz package on input line 36.
3: Removed 200 row(s) containing missing values (geom_path).
4: Package ctable Warning:  Transparency disabled: incompatible with tikz package on input line 36.
5: Package ctable Warning:  Transparency disabled: incompatible with tikz package on input line 36.
6: Package ctable Warning:  Transparency disabled: incompatible with tikz package on input line 36.
7: Package ctable Warning:  Transparency disabled: incompatible with tikz package on input line 36.
8: Package ctable Warning:  Transparency disabled: incompatible with tikz package on input line 36.
9: Package ctable Warning:  Transparency disabled: incompatible with tikz package on input line 36.
10: Package ctable Warning:  Transparency disabled: incompatible with tikz package on input line 36.
11: Package ctable Warning:  Transparency disabled: incompatible with tikz package on input line 36.
12: Removed 861 rows containing non-finite values (stat_smooth).
13: Removed 861 rows containing missing values (geom_point).
14: Package ctable Warning:  Transparency disabled: incompatible with tikz package on input line 36.
15: Transformation introduced infinite values in continuous y-axis
16: Transformation introduced infinite values in continuous y-axis
17: In self$trans$transform(x) : NaNs produced
18: Transformation introduced infinite values in continuous y-axis
19: Removed 1019 rows containing missing values (position_stack).
20: Removed 1054 rows containing missing values (position_stack).
21: Removed 8 rows containing missing values (geom_segment).
22: Removed 439 row(s) containing missing values (geom_path).
23: Removed 8 rows containing missing values (geom_label_repel).
24: Package ctable Warning:  Transparency disabled: incompatible with tikz package on input line 36.
25: In in_dir(input_dir(), evaluate(code, envir = env, new_device = FALSE,  ... :
  You changed the working directory to /media/bay/taha/chepec/thesis (probably via setwd()). It will be restored to /media/bay/taha/chepec/thesis/assets/aux/chunks. See the Note section in ?knitr::knit
26: In '<' : boolean operators not defined for 'errors' objects, uncertainty dropped
27: In 'Ops' : non-'errors' operand automatically coerced to an 'errors' object with no uncertainty
28: In in_dir(input_dir(), evaluate(code, envir = env, new_device = FALSE,  ... :
  You changed the working directory to /media/bay/taha/chepec/thesis (probably via setwd()). It will be restored to /media/bay/taha/chepec/thesis/assets/aux/chunks. See the Note section in ?knitr::knit
29: In in_dir(input_dir(), evaluate(code, envir = env, new_device = FALSE,  ... :
  You changed the working directory to /media/bay/taha/chepec/thesis (probably via setwd()). It will be restored to /media/bay/taha/chepec/thesis/assets/aux/chunks. See the Note section in ?knitr::knit
30: In in_dir(input_dir(), evaluate(code, envir = env, new_device = FALSE,  ... :
  You changed the working directory to /media/bay/taha/chepec/thesis (probably via setwd()). It will be restored to /media/bay/taha/chepec/thesis/assets/aux/chunks. See the Note section in ?knitr::knit
```

**Regarding the ctable and TikZ warning**
From the `ctable` manual:
> ctable checks if the tikz package is loaded and if so, disables its own transparency with a warning.

And there seems to be no easy way to suppress this warning.

+ https://tex.stackexchange.com/questions/253401/tikz-and-ctable-incompatibility-gives-error-when-printing
+ https://github.com/ho-tex/transparent/issues/1

**The working directory warnings (due to our use of `isolatedChild()`)**
I thought that perhaps my use of `here()` in the argument to `isolatedChild()` was
the cause, but removing the `here()` wrapper around the input file path did not
alter the warning message or the output.

Setting `opts_knit$get("root.dir")` to `here::here()` either globally
(for the entire document) or locally (as an argument to `knit_child(options=)`)
had no apparent effect. The working directory inside the `IsolatedChild()`
function was still `/media/bay/taha/chepec/thesis/assets/aux/chunks`.
Well, no wonder, because the `options` argument only works for *chunk* options,
**not** *knit* options (`root.dir` is the latter).

It seems clear that knitr is being extra careful with working directory settings,
and *not* assuming the document will use `here::here()` or similar.
All my efforts to get rid of this warning failed and only led to errors instead.

For reference, this is he Note section in `?knitr::knit`:

> The working directory when evaluating R code chunks is the
> directory of the input document by default, so if the R code
> involves external files (like ‘read.table()’), it is better to put
> these files under the same directory of the input document so that
> we can use relative paths. However, it is possible to change this
> directory with the package option ‘opts_knit$set(root.dir = ...)’
> so all paths in code chunks are relative to this ‘root.dir’. It is
> not recommended to change the working directory via ‘setwd()’ in a
> code chunk, because it may lead to terrible consequences (e.g.
> figure and cache files may be written to wrong places). If you do
> use ‘setwd()’, please note that ‘knitr’ will always restore the
> working directory to the original one.  Whenever you feel
> confused, print ‘getwd()’ in a code chunk to see what the working
> directory really is.

> If the ‘output’ argument is a file path, it is strongly
> recommended to be in the current working directory (e.g. ‘foo.tex’
> instead of ‘somewhere/foo.tex’), especially when the output has
> external dependencies such as figure files. If you want to write
> the output to a different directory, it is recommended to set the
> working directory to that directory before you knit a document.
> For example, if the source document is ‘foo.Rmd’ and the expected
> output is ‘out/foo.md’, you can write ‘setwd('out/');
> knit('../foo.Rmd')’ instead of ‘knit('foo.Rmd', 'out/foo.md')’.

> N.B. There is no guarantee that the R script generated by ‘purl()’
> can reproduce the computation done in ‘knit()’. The ‘knit()’
> process can be fairly complicated (special values for chunk
> options, custom chunk hooks, computing engines besides R, and the
> ‘envir’ argument, etc). If you want to reproduce the computation
> in a report generated by ‘knit()’, be sure to use ‘knit()’,
> instead of merely executing the R script generated by ‘purl()’.
> This seems to be obvious, but some people just do not get it.
