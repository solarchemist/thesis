# PhD thesis source (LaTeX + R) and data

Rnoweb is a type of literate programming, where the text (LaTeX in this case)
is interwoven or knitted with program code (R) in the same file.
LaTeX and R mix nicely thanks to [knitr](https://yihui.org/knitr), which allows
our R code to generate perfectly typeset LaTeX/TikZ plots and tables, among other
benefits.

In order to separate, as much as possible, the LaTeX preamble and the R code
from the text of the thesis itself the work was split over several *child* Rnoweb
files, all references from the top parent `0000-thesis.Rnw` or one of its children.

The `thesis.pdf` file in this repo should exactly match the PDF published on DiVA
(when compiled in *final mode*).
In *draft mode*, the compiled PDF is printed on A4 stock and includes information
in the margins and outside that may be of use during writing, such as bibkeys,
refkeys, git commit information, etc.
Note that this repository is set to *draft mode* by default.

I have, as far as time permitted, pruned this repository from legacy code, unnecessary data files, and other
bits and pieces that are not required to reproduce the thesis (the repo should
not contain any files that are not in some way referenced by either the LaTeX
or R code).

To work with this repository I suggest using a modern text editor with
support for syntax highlighting of `Rnw` files, such as VSCodium (with the
[R](https://open-vsx.org/extension/REditorSupport/r) and
[LaTeX Workshop](https://open-vsx.org/extension/James-Yu/latex-workshop) extensions).
[VSCodium](https://github.com/VSCodium/vscodium) is libre licensed and
[freely available for all platforms](https://vscodium.com/#install). But since all
the source files are just UTF-8 text files you can of course use any text editor you like.

This is the main README of this repository.
This repository also contains the following *sub*-READMEs:

+ [assets](assets/README.md)
+ [glossaries](assets/glossaries/README.md)
+ [references](assets/references/README.md)
+ [stylesheet](assets/stylesheet.md)
+ [layouts](assets/layouts/README.md)



## Compile the thesis

Tested on Ubuntu 22.04 (Jammy) with R v4.1.3 and TeXLive 2023.
Please open an issue if you would like to contribute compile instructions for
other OSes or versions or if you find reproduction issues.

To reproduce the thesis (including its plots, tables, etc.) from the R/LaTeX
source code, first clone this repo (the Codeberg or Github repos are identical,
choose whichever you prefer):
```
$ git clone https://codeberg.org/solarchemist/thesis.git
```

Enter into the directory of your cloned repo and use `renv` to restore all R package
dependencies:
```
$ cd thesis
$ R
> renv::restore()
> quit()
```

Knit the R chunks (knitr is configured to create `thesis.tex`, as well as a `tex`
and a `pdf` file for each R plot):
```
$ Rscript -e "library(knitr); library(methods); knit('thesis.Rnw')"
```

Create the thesis PDF by compiling LaTeX (multiple reruns are necessary, best handled
by `latexmk` or `arara` or similar, use a build tool of your choice, I like `latexmk`):
```
latexmk -pdf -bibtex thesis
```

You should now have `thesis.pdf` in the root of the git repository, by default in *draft mode*.
Follow the instructions below to recompile it in *final mode*.


### Compile the thesis in draft mode (default)

+ Add `draft` to the `documentclass` options: `\documentclass[draft]{LuaUUThesis}`.
+ Optionally, set `selection=all` in both the Symbols and Acronyms glossaries.

We also have an R variable, `doc.is.draft`, which is set to `TRUE` by default
(so it assumes draft mode). If you are switching back from `final` mode make sure
to reset it or comment out any explicit declarations.


### Compile the thesis in final mode

To switch the thesis to **final mode**:

+ **remove** `draft` from the `documentclass` options,
+ **set** `doc.is.draft=FALSE` anywhere (but I suggest using the `knitr-chunk-draft` chunk)
+ optionally, revert `selection=all` in the glossaries settings to another option
  that only includes referenced glossary entries in the "List of", such as
  `selection=recorded and deps and see`.

Please note:

+ do not add `final` to the documentclass options, it's *implied* (in fact,
  adding it causes TeX errors)
+ the `draft`/`final` setting is inherited by many other packages,
  such as `fixme`, `showlabels`, `hyperref`, and `microtype`
+ `final` mode automatically hides FiXme corrections and showlabels labels
+ more details, see: https://tex.stackexchange.com/a/95335/10824

Our physical page settings require `luatex85`. For more on this subject, see
[commit f0e06b4d11](https://git.solarchemist.se/latex/uuthesistemplate/commit/f0e06b4d117905be7e10f20f233f790fc1289717).



## Dependencies (R and TeXLive/MiKTeX/MacTeX)

This thesis was compiled with R v4.1.3 and TeXLive 2023 (newer versions might work - if
you try and confirm they do, please let me know by adding an issue or pull request).

To reproduce this thesis I suggest you install R and TeXLive in an Ubuntu v22.04 (Jammy)
container/virtual machine (how to do this depends on your operating system, I
recommend WSL2 on Windows and suggest LXD/Incus or VirtualBox on other operating systems).

+ https://solarchemist.se/2020/11/17/measurement-errors/#install-wsl2-on-windows-10
+ https://documentation.ubuntu.com/lxd/en/latest/installing
+ https://github.com/lxc/incus
+ https://www.virtualbox.org/wiki/Downloads

Install TeXLive (or MikTeX/MacTeX as per your preference) by following their
instructions.

+ https://tug.org/texlive

You must download the following git repositories that contain custom LaTeX `cls`/`sty` files
that this thesis depends on:

+ https://git.solarchemist.se/latex/uuthesistemplate
+ https://git.solarchemist.se/latex/ifprintedition
+ https://git.solarchemist.se/latex/uuprintcolors
+ https://git.solarchemist.se/latex/spacegroup

Install them by cloning each repo into a suitable place in your `TEXMF` tree
and then run `texhash`, for example:

```
$ cd /usr/local/texlive/texmf-local/tex/latex
$ git clone https://git.solarchemist.se/latex/uuthesistemplate.git
$ git clone https://git.solarchemist.se/latex/ifprintedition.git
$ git clone https://git.solarchemist.se/latex/uuprintcolors.git
$ git clone https://git.solarchemist.se/latex/spacegroup.git
$ texhash
```

+ https://tex.stackexchange.com/questions/1137/where-do-i-place-my-own-sty-or-cls-files-to-make-them-available-to-all-my-te
+ http://matsguru.com/latex-hack-adding-a-custom-cls-to-your-search-path
+ https://tex.stackexchange.com/questions/8357/how-to-have-local-package-override-default-package/8359
+ https://tex.stackexchange.com/questions/10252/how-do-i-add-a-sty-file-to-my-mactex-texshop-installation

Well done!

A tip: Ubuntu 22.04 offers R v4.1.2 in its `universe` repos, which makes it very
easy to install and which should work fine (if not, please let me know):
```
$ sudo apt update
$ sudo apt install --no-install-recommends r-base r-base-dev build-essential
```

Or you can always install any R version by compiling it from source.
Check out Posit's docs or my R Ansible role for more details.

+ https://docs.posit.co/resources/install-r-source
+ https://codeberg.org/ansible/R



## Links and notes

On my linkblog I have some notes that highlight some
useful LaTeX macros I made as part of this thesis, you might want to check them out:

+ [Cross-reference figures or tables from outside the document using cleveref and friends](https://links.solarchemist.se/shaare/GuXgNw)
+ [Hyperlinked DOI icon in bibliography entries with biblatex](https://links.solarchemist.se/shaare/iyy4lQ)
+ [Typeset vibrational mode assignments with LaTeX](https://links.solarchemist.se/shaare/HjtQ5g)
+ [How to generate BIB file containing only works cited](https://links.solarchemist.se/shaare/ye0j2g)
+ [A note on working with bib2df and bib2gls](https://links.solarchemist.se/shaare/MvABwQ)
