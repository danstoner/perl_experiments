#!/usr/bin/perl

use strict;
use warnings;

use Getopt::Long;


# This script will always force extension to lowercase (e.g. .JPG to .jpg).

# options variables
my $verbose = '';         # verbosity (default = false)
my $help = '';            # help or usage (default = false)
my $pixel_width = 600;    # width of output images (default = 600)
my $index_digits = 3;     # the number of digits in the file index
# options variables requiring a value
my $in_dir = '';          # the directory containing raw input files. REQUIRED
my $out_dir = '';         # the directory for renamed output files.   REQUIRED
my $resized_out_dir = ''; # the directory for images resized for web. REQUIRED
my $start_index = '';     # starting index for output files           REQUIRED
my $out_prefix = '';      # string to prepend to output filename      REQUIRED
my $out_suffix = '';      # string to append to output filename (before extension) REQUIRED


my $usage =
'
image-resize-rename-forweb.pl   - resize and rename images to meet specified pattern and size.

Usage:

  image-resize-rename-forweb.pl [options] -i dir1 -o dir2 -w dir3 --prefix=X --suffix=XXXXX 

Options:

   -h, --help, --usage
          Display this usage help text.
   -v, --verbose
          Turn on verbose mode.

   -w, --width
          Width of resized images in pixels (default 600 px)
   -x, --index_digits
          The number of digits in the unique filename index (default 3 digits)

Required Options:

   -i, --in_dir
          The directory containing raw input files.
   -o, --out_dir
          The directory for renamed output files.
   -w, --resized_out_dir
          The directory for web resized output files.
   --prefix
          The prefix for each new filename
   --suffix
          The suffix to append to the output filename (before the extension)
';

# check to see if sane options were passed

# If no options specified print usage and exit
if ($#ARGV + 1 == 0) { print $usage; exit;}


#  GetOptions ('length|height=f' => \$length, "head" => \$head);

#GetOptions ('' ==> \$ , "" => \$

GetOptions (
            'v|verbose' => \$verbose,
            'h|help|usage' => \$help
           );

# If help option is specified print usage and exit.
if ($help)  { print $usage; exit;}

if ($verbose) {print "Verbose mode enabled.\n";}


### $verbose = '';        
### $help = '';           
# $pixel_width = 600;   
# $index_digits = 3;    # if no args or usage or help passed, spit out...
# ptions variables requi#if (
# $in_dir = '';           print $usage;
# $out_dir = '';        
# $resized_out_dir = '';
# $start_index = '';    # check to see if Image Magick convert command is installed.
# $out_prefix = '';     # 
# $out_suffix = '';     


my $convert = `convert --version`;
if ($convert !~ /Version: ImageMagick/) 
   {  print "$convert\n";
      print "\n";
      die 'ImageMagick "convert" command does not seem to be installed.';
# Sample valid ImageMagick output from version check "convert --version"
# Version: ImageMagick 6.5.4-7 2012-04-10 Q16 OpenMP http://www.imagemagick.org
# Copyright: Copyright (C) 1999-2009 ImageMagick Studio LLC

   }
else {    if ($verbose) {print "Using...\n$convert\n";}}




# check to see if specified directories exist



print "The end! \n";
__END__
