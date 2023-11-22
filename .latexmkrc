# https://www.ctan.org/tex-archive/support/latexmk/example_rcfiles
# This shows how to use xelatex (http://en.wikipedia.org/wiki/XeTeX)
# with latexmk.  Xelatex uses Unicode and "supporting modern font
# technologies such as OpenType or Apple Advanced Typography.
#
#   WARNING: latexmk.pl is changing, and plans to have more internal
#     support for xelatex.
#
# Since xelatex only produces pdf files, it is a replacement for
# pdflatex.  To make it your default typesetting engine within latexmk
# you will not only need to set the $pdflatex variable to require the
# use of xelatex, but also to turn on production of pdf files and to
# turn off the production of dvi and ps files, as in the following
# code:

$pdflatex = 'lualatex -file-line-error %O %S';
$pdf_mode = 1;
$postscript_mode = $dvi_mode = 0;

# generate glossaries
# http://tex.stackexchange.com/a/62077
# https://www.dickimaw-books.com/latex/thesis/html/latexmk.html#sec:latexmk
# input and output files by glossary type for makeindex/xindy
# | glossary | input | output |
# | ======== | ===== | ====== |
# | main     | glo   | gls    |
# | acronyms | acn   | acr    |
# | symbols  | slo   | sls    |

add_cus_dep('glo', 'gls', 0, 'run_makeglossaries');
add_cus_dep('acn', 'acr', 0, 'run_makeglossaries');
add_cus_dep('slo', 'sls', 0, 'run_makeglossaries');

sub run_makeglossaries {
   system( "makeglossaries '$_[0]'" );
}

# the following code based the example rcfile bib2gls
# https://ftp.acc.umu.se/mirror/CTAN/support/latexmk/example_rcfiles/bib2gls_latexmkrc
# https://tex.stackexchange.com/a/401979/10824
push @generated_exts, 'glstex', 'glg';
add_cus_dep('aux', 'glstex', 0, 'run_bib2gls');

sub run_bib2gls {
   if ( $silent ) {
      my $ret = system "bib2gls --silent --group '$_[0]'";
   } else {
      my $ret = system "bib2gls --group '$_[0]'";
   };

   my ($base, $path) = fileparse( $_[0] );
   if ($path && -e "$base.glstex") {
      rename "$base.glstex", "$path$base.glstex";
   }

   # Analyze log file.
   local *LOG;
   $LOG = "$_[0].glg";
   if (!$ret && -e $LOG) {
      open LOG, "<$LOG";
	   while (<LOG>) {
         if (/^Reading (.*\.bib)\s$/) {
            rdb_ensure_file( $rule, $1 );
         }
	   }
	   close LOG;
   }
   return $ret;
}
