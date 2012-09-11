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
my $in_dir = '';          # the directory containing raw input files.        REQUIRED
my $out_dir = '';         # the directory for renamed output files.   REQUIRED
my $resized_out_dir = ''; # the directory for images resized for web. REQUIRED
my $start_index = '';     # starting index for output files
my $out_prefix = '';      # string to prepend to output filename
my $out_suffix = '';      # string to append to output filename (before extension)


my $usage =
'
image-resize-rename-forweb.pl

Usage:

   --help | -h | --usage   Display this usage help text.
   --verbose | -v          Turn on verbose mode.
   --width | -w            Width of resized images in pixels
   --in_dir    | -i        The directory containing raw input files.
   --out_dir   | -o        The directory for renamed output files.
   --resized_out_dir | -w  The directory for web resized output files. 
';

# check to see if sane options were passed

print $usage;


# check to see if Image Magick convert command is installed.
# 
# convert --version
# Version: ImageMagick 6.5.4-7 2012-04-10 Q16 OpenMP http://www.imagemagick.org
# Copyright: Copyright (C) 1999-2009 ImageMagick Studio LLC



# check to see if specified directories exist



print "The end! \n";
__END__
