# Bibliography


## Subscript and superscripts in titles

For single letters, simply use Unicode (copy-pasting the symbol directly into the
title in Zotero). I have set "Export unicode as plain-text latex commands" in
the BBT settings, and also in the BBT the Automatic export tab.

For longer or more complicated subscripts and superscripts, use HTML tags.
E.g., "Procedure for solution growth of ZnS, CdS and
Zn<sub>1-<i>x</i></sub>Cd<sub><i>x</i></sub>S thin films by successive
ionic-layer adsorptions and reactions".

+ https://unicode-table.com/en/sets/superscript-and-subscript-numbers/


## Titles are auto-capitalised by Better BibTeX in Zotero

This automatic title-casing which Zotero and BBT applies works fine in most cases.
**This presupposes that titles in Zotero are entered using sentence-case.**

But I have observed an issue for single-letter non-capitalised words, e.g.,
Laflere1974, "On the differential capacitance of the n- and p-type..." which becomes
rendered with capital "N-" in the thesis bibliography, which is not correct.

+ Putting single (or double) braces around the letter "{n}" in Zotero only causes
  the braces to be printed in the bibliography.
+ The BBT FAQ describes the definitive solution: enclose the letter in
  `<span class="nocase">...</span>`.

+ https://retorque.re/zotero-better-bibtex/support/faq/#bbt-is-changing-the-capitalization-of-my-titles----why


## Name suffixes, Jr. and the like

Add them to the end of the given name field in Zotero, after a comma.

+ https://forums.zotero.org/discussion/comment/130244/ (see the last comment)


## Links and notes

+ [How to not mess up your bibliographies with BibTeX](https://clauswilke.com/blog/2015/10/02/bibtex/),
  Claus O. Wilke (2015)
