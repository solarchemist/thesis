# Stylesheet


## Linguistic conventions used in this thesis

In general, we follow British English conventions, specifically Oxford spelling.
See below for details and exceptions.


### Capitalization

https://en.wikipedia.org/wiki/Wikipedia_talk:Manual_of_Style/Archive_(capitalization)

Capitalize **the Sun** only in astronomical contexts.

> When the noun **earth** refers to our planet, it is capitalized only when it's
> a proper noun (meaning it acts like a name and is not preceded by *the*—for example,
> *everything on Earth*). The word is not capitalized when it is a common noun
> (meaning it does not act like a name and is preceded by *the*—e.g.,
> *everything on the earth*).
> https://grammarist.com/style/earth/

Capitalize the X in **X-ray**.

> Looking through the first 250 cites in the Corpus of Contemporary American English,
> the capitalized version is preferred by a factor of 2:1; looking through the
> first 250 cites in the British National Corpus, it wins by a factor of 11:1.
> https://english.stackexchange.com/questions/9891/capitalization-of-x-in-x-ray



### Spelling (with examples)

Write *metre* and **not** *meter* (except when you are talking about an actual
measuring device, which *should* be spelled meter).

In general, prefer *-ise* over *-ize*.

| **Examples to follow**  | Please do not         | Reason                        |
|------------------------ |---------------------- |------------------------------ |
| do not                  | don't                 | well, just do not             |
| black body              | blackbody             |                               |
| band gap                | bandgap               |                               |
| acknowledgement         | acknowledgment        | BrE spelling                  |
| zincblende              | zinc blende           |                               |
| wurtzite                | würtzite              |                               |
| UV-Vis-NIR              | UV/Vis/NIR            | see definition in glossary    |
| seawater                | sea water             | following Wikipedia's example |
| atomic layer deposition | atomic-layer ...      | see definition in glossary    |
| digitize                | digitise              | BrE Oxford spelling           |
| lifetime                | life-time, life time  | IUPAC Gold book               |
| light bulb              | light-bulb, lightbulb | see refs below                |
| quantized               | quantised             | BrE Oxford spelling           |
| scaleable               | scalable              | BrE I think                   |
| grey                    | gray                  | grey more common in BrE       |
| heatsink                | heat-sink             | personal preference           |
| hot plate               | heat plate            | per Wikipedia, etc.           |
| fume hood               | fumehood              | per Wikipedia, etc.           |
| aesthetic               | esthetic              | personal preference           |
| Uppsala University      | Uppsala university    | LN insists                    |
| thin film               | thin-film             | Wikipedia and consensus       |
| fulfil                  | fulfill               | BrE                           |
| nanosize                | nano-size             | common enough to drop hyphen  |
| ultrastable             | ultra-stable          | personal preference           |
| ultrasmall              | ultra-small           | without hyphen more common    |
| word cloud              | wordcloud             | popular convention it seems   |
| water bath              | waterbath             | suggested by spell-checker    |
| ice bath                | icebath               | for consistency               |
| gas flow                | gasflow               | popular convention it seems   |
| hematite                | haematite             | personal preference           |
| dead time               | deadtime              | popular convention it seems   |
| electrolyse             | electrolyze           | -lyse, -lyser is BrE          |
| wave function           | wavefunction          | personal preference           |
| so called               | so-called             | preference, for consistency   |

19th century or 19^th century (i.e., superscript or not)? There is no rule, except
to make it pretty and readable. So if for no other reason than to make it prettier,
let's try to stick with superscript.
Always use our custom command, like so `\century{19}`.

**Sulfide** or *sulphide*?
IUPAC recommends sulfide/sulfur, so we will use that despite *ph* being preferred in BrE.

The *noun* is **licence**, but the verb is spelled with **s**.
So *an open source licence* and *open-source licensed*.

**Decolourization** or decolouration? I think the former (just based on how it sounds).


+ https://en.wikipedia.org/wiki/Oxford_spelling
+ https://en.wikipedia.org/wiki/Wikipedia:Manual_of_Style/Spelling
+ https://english.stackexchange.com/questions/366269/v-or-vs-for-versus
+ https://www.quora.com/Is-it-vs-vs-or-v-s
+ https://abbreviations.yourdictionary.com/is-vs-or-vs-the-correct-abbreviation-format.html
+ https://dictionary.cambridge.org/dictionary/english/digitize
+ https://en.wiktionary.org/wiki/digitise
+ https://goldbook.iupac.org/terms/view/L03515
+ https://www.dailywritingtips.com/should-light-bulb-be-one-word-or-two/
+ https://www.merriam-webster.com/dictionary/light%20bulb
+ https://english.stackexchange.com/questions/93008/20th-century-vs-20%E1%B5%97%CA%B0-century
+ https://editorsmanual.com/articles/centuries/
+ https://tex.stackexchange.com/questions/140636/possible-ways-to-format-a-specific-century-in-latex
+ https://english.stackexchange.com/questions/34350/in-british-english-should-it-be-licensee-or-licencee


### Hyphens and dashes

Use *em*-dash **without** surrounding spaces. Although some sources
(https://en.wikipedia.org/wiki/Dash\#En_dash_versus_em_dash) say that
British English prefers the use of *en*-dash with spaces instead of **em**-dash,
I think we should stick with the *em*-dash to avoid ambiguity, as the *en*-dash
is used for numeric ranges and similar (and then usually comes with surrounding
spaces).

+ https://english.stackexchange.com/a/2126
+ https://english.stackexchange.com/a/154998

When joining two names in a phrase, such as Haber--Bosch, use en-dash.

+ https://en.wikipedia.org/wiki/Wikipedia:Hyphens_and_dashes


### Citations/parenthesis before or after period?

Consider the placement of the dot ending the sentence in these two cases:

> A pyranometer is a device for measuring heat radiation. \cite{Abbot1916}
> **A pyranometer is a device for measuring heat radiation \cite{Abbot1916}.**

As with many other things, it can go both ways.
https://tex.stackexchange.com/questions/34414/should-you-put-citations-before-or-after-interpunction

But the majority appear to **favour citations *before* the punctuation mark**,
so we will go with that.

Now consider:

> (An entire sentence inside parenthesis).
> **(An entire sentence inside parenthesis.)**

Most prefer keeping the period inside the parentheses. This also seems to be
the British English convention. Note: this is not how I'm used to doing it,
so be careful with this!

+ https://english.stackexchange.com/a/124655
+ https://english.stackexchange.com/a/11129



## Refs

+ https://explorationsofstyle.com/2023/02/22/style-sheets
+ https://patthomson.net/2013/09/05/writing-as-we
+ https://english.stackexchange.com/questions/9986/style-question-use-of-we-vs-i-vs-passive-voice-in-a-dissertation
+ https://english.stackexchange.com/questions/24629/use-of-i-we-and-the-passive-voice-in-a-scientific-thesis
