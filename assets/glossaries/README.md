# Glossaries

## How should symbols be ordered (sorting)?

This correspondence table could help with the ordering:
https://silentlanguageofthebirds.wordpress.com/greek-table-of-correspondence

Should we add a `sort` key? Not necessarily, and the warning `identical sort values` can
safely be ignored (if it occurs).

> In general, you typically shouldn't set the sort field in the bib file, but
> instead use bib2gls's fallback system to choose the most appropriate field.
> https://latex.net/sorting-glossaries-with-bib2gls/

For the symbols glossary, since we have defined our symbols using `@symbol{...}`
entries, the default sort method used by `bib2gls` is to sort by the bibtex label
(this is well-explained in the Introductory Guide, @Talbot2018 pp. 114).
Adding an explicit `sort` key overrides all that, as expected.


## We generate `symbols.bib` from R tibble

**To add/edit the symbols glossary, do it in `symbols.Rnw`.**

We are generating the `.bib` file from R, in order to define
symbols that are SI constants using the `constants` package
(this way, we need not look up and maintain the definitions ourselves).

> `symbols.bib` is *generated* from `symbols.Rnw`

+ https://cran.r-project.org/web/packages/bib2df/vignettes/bib2df.html
+ https://github.com/ropensci/bib2df/
+ https://www.pauloldham.net/creating-a-bibliography-with-rcrossref/
+ https://rdrr.io/cran/knitr/man/write_bib.html


## Automated case-changing

If the `mfirstuc` package is detected (which it is), the following two options
are set by default according to the `bib2gls` output in `*.glg`:
```
Detected package mfirstuc 2022/10/14
No sentence case protection required now
Default setting --no-mfirstuc-protection now applied, use --mfirstuc-protection to revert
Default setting --no-mfirstuc-math-protection now applied, use --mfirstuc-math-protection to revert
```

To avoid automated case-changing by `bib2gls`, I have inserted an empty group, `{}`,
at the beginning of each `name` field in the symbols glossary.
This functionality is described in the Introductory Guide, @Talbot2018 section 3.2).


### Integrating `errors` with siunitx and trialling `units` with siunitx

The `Value` field can easily be made to incorporate a value from `constants`.

But the `Units` field is trickier.
We can do something like
```{r eval=FALSE}
> syms_with_units$k %>% deparse_unit()
[1] "J K-1"`
```
to see the unit as a string, but note how it does not use the full name of each unit, which
`siunitx` does. I wonder if that full name, or a correlation table between short names and
full names exist somewhere in the `units` or even `udunits2` packages?
For now, we cannot integrate units with `siunitx` in any meaningful way.

Old links regarding putting units into their own bib field:

+ https://ftp.acc.umu.se/mirror/CTAN/support/bib2gls/bib2gls-begin.pdf
+ https://tex.stackexchange.com/questions/447208/ordered-symbols-list-with-units
+ https://tex.stackexchange.com/questions/393148/defining-a-new-3-column-glossaries-style


## `bib2gls` fails if any entry contains empty `see={}` field

Sort of makes sense.
See [note on my linkblog](https://links.solarchemist.se/shaare/MvABwQ).

Since I use R's `bib2df::df2bib()` to generate the `.bib` file from a tibble,
and the tibble by necessity contains one column for each field, any entries
with empty `see` fields get converted to `see={}` by `df2bib()`.

I have found a simple-enough workaround---just remove all lines with empty `see`
fields from the `.bib` file in the R script (for example using `sed`).

This is not a bug in either ` bib2df::` or `bib2gls`.


```
Processing resource thesis-1.glstex.
Parsing fields for entry 'absorption_coefficient'
Checking field aliases for absorption_coefficient.
Value=>user1={}
Unit=>user2={}
Exact=>user3={}
>> name={{}\ensuremath{\alpha}}
=>> name={{}\ensuremath{\alpha}}
>> first={absorption coefficient, \ensuremath{\alpha}}
=>> first={absorption coefficient, \ensuremath{\alpha}}
>> text={absorption coefficient}
=>> text={absorption coefficient}
>> description={absorption coefficient}
=>> description={absorption coefficient}
>> user1={}
=>> user1={}
>> user2={}
=>> user2={}
>> user3={}
=>> user3={}
>> see={}
=>> see={}
Checking cross-references for: absorption_coefficient
Field alias not set.
Error: EOFException
com.dickimawbooks.texparserlib.TeXParser.popStack(TeXParser.java:2635)
com.dickimawbooks.texparserlib.TeXObjectList.popArg(TeXObjectList.java:1294)
com.dickimawbooks.texparserlib.TeXObjectList.popArg(TeXObjectList.java:1275)
com.dickimawbooks.bib2gls.Bib2GlsEntry.initSeeRef(Bib2GlsEntry.java:4710)
com.dickimawbooks.bib2gls.Bib2GlsEntry.initCrossRefs(Bib2GlsEntry.java:4694)
com.dickimawbooks.bib2gls.GlsResource.processBibList(GlsResource.java:6722)
com.dickimawbooks.bib2gls.Bib2Gls.process(Bib2Gls.java:2706)
com.dickimawbooks.bib2gls.Bib2Gls.main(Bib2Gls.java:6616)
```


## Links and notes

+ https://latex.net/sorting-glossaries-with-bib2gls
+ https://www.dickimaw-books.com/latex/buildglossaries
+ https://github.com/nlct/bib2gls
+ https://git.solarchemist.se/taha/thesis/issues/8
+ https://git.solarchemist.se/taha/thesis/issues/9
