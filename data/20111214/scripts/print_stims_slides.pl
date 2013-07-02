#!/usr/bin/perl -w 
# Time-stamp: <2011-12-14 13:38:44 amoebe> 
# Kristine Yu/UCLA Linguistics 

# Perl script replaces the symbols for voice quality with
# human-readable equivalents <blank> = modal <_> = creaky <__> =
# breathy

print "\\documentclass\[12pt\]\{article\}\n";
print "\\usepackage\{geometry\}\n";
print "\\geometry\{letterpaper\}\n";     
print "\\geometry\{landscape\}\n";  
print "\\usepackage\{fullpage\}\n";
print "\\usepackage\{fix-cm\}\n";
print "\\usepackage\{times\}\n";
#print "\\renewcommand\{\\familydefault\}\{\\sfdefault\}\n";
print "\\pagestyle\{empty\}\n";
print "\\title\{\}\n";
print "\\date\{\}\n"; 
print "\\begin\{document\}\n";
print "\\maketitle\n";
print "\\thispagestyle\{empty\}\n";
#print "\\begin\{Huge\}\n";

while (<>) {
    chomp;
    # If you want to try matching strings which may contain
    # newlines, here's the trick to use: Uncomment this next
    # line, then use a pound sign ("#") wherever you mean to
    # have a newline within your data string.
    # s/#/\n/g;
   #  s/ẹ/\\d{e}/g;
   #  s/ụ/\\d{u}/g;
   #  s/ọ/\\d{o}/g;
   # s/Ọ/\\d{O}/g;
   # s/`ọ/\\d{\\`o}/g;
   #  s/ọ/\\d{o}/g;
   #  s/á/\\'a/g;
   #  s/à/\\`a/g;
   #  s/->/\\\$\\rightarrow\$/g;
    ($item, $word1, $word2, $verb, $gloss1, $gloss2, $verbeng, $tone1, $tone2, $pattern, $kirisent, $englsent )=split(/\t/,$_);

	    print "\\fontsize\{40\}\{50\}\\selectfont \\center{$englsent\}\n\n\\fontsize\{60\}\{70\}\\selectfont \\center{$kirisent\}\n\\vspace\{\\fill\}\\eject\n";    
#    print "\\vspace\*\{\\fill\}\n\\fontsize\{100\}\{120\}\\selectfont \\centerline\{$_\}\n\\vspace\{\\fill\}\\eject\n";    
}

#print "\\end\{Huge\}\n";
print "\\end\{document\}";


