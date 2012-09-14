#!/usr/bin/perl
# image-resize-rename-forweb.pl
# A script for doing mass-rename, resize, and filing of images.
# A renamed version of the image gets placed in its permanent location.
# A resized and renamed version of the file gets placed in a folder for later upload to the web.
# Note: This script will likely always force extension to lowercase (e.g. .JPG to .jpg).
#
# Future Features:
#  - consider using Getopt::ArgvFile to allow settings to be stored in config files.
#  - ?
#  - ?
#

use strict;
use warnings;

use Getopt::Long;


my $usage =
'
image-resize-rename-forweb.pl   - resize and rename images to meet specified pattern and size.

Usage:

  image-resize-rename-forweb.pl [options] -i dir1 -o dir2 -w dir3 -s N --prefix=X --suffix=XXXXX 

Options:

   -h, --help, --usage
          Display this usage help text and exit.
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
   -s, --start_index
          The starting number for incremental file index numbers
   --prefix
          The prefix for each new filename
   --suffix
          The suffix to append to the output filename (before the extension)
';


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


# spit out a new line
print "\n";

# check to see if sane options were passed

# If no options specified print usage and exit
if ($#ARGV + 1 == 0) { usage(); exit;}

#  GetOptions ('length|height=f' => \$length, "head" => \$head);

#GetOptions ('' ==> \$ , "" => \$

GetOptions ('v|verbose'            => \$verbose
           ,'h|help|usage'         => \$help
           ,'w|width=i'            => \$pixel_width
           ,'x|index_digits=i'     => \$index_digits
           ,'i|in_dir=s'           => \$in_dir
           ,'o|out_dir=s'          => \$out_dir
           ,'w|resized_out_dir=s'  => \$resized_out_dir
           ,'s|start_index=i'      => \$start_index
           ,'prefix=s'             => \$out_prefix
           ,'suffix=s'             => \$out_suffix
           );

# If help option is specified print usage and exit.
if ($help)  { usage(); exit;}

if ($verbose) {print "Verbose mode enabled.\n";}

# summarize all options if verbose
if ($verbose)
{
    print "Options / Variables in use...           \n";
    print "  --width = $pixel_width                 \n";
    print "  --index_digits = $index_digits         \n";
    print "  --in_dir = $in_dir                     \n";
    print "  --out_dir = $out_dir                   \n";
    print "  --resized_out_dir = $resized_out_dir   \n";
    print "  --start_index = $start_index           \n";
    print "  --prefix = $out_prefix                 \n";
    print "  --suffix = $out_suffix                 \n";
}

# Make sure the required options are all present.

if (!$in_dir)           {usage(); die "*** Missing required option --in_dir ***          \n\n";}

if (!$out_dir)          {usage(); die "*** Missing required option --out_dir ***         \n\n";}

if (!$resized_out_dir)  {usage(); die "*** Missing required option --resized_out_dir *** \n\n";}

if (!$start_index)      {usage(); die "*** Missing required option --start_index ***     \n\n";}

if (!$out_prefix)       {usage(); die "*** Missing required option --prefix ***          \n\n";}

if (!$out_suffix)       {usage(); die "*** Missing required option --suffix ***          \n\n";}


# Check to see if ImageMagick is installed

my $convert = `convert --version`;
if ($convert !~ /Version: ImageMagick/) 
   {  print "$convert\n";
      print "\n";
      die '*Error* ImageMagick "convert" command does not seem to be installed.';
# Sample valid ImageMagick output from version check "convert --version"
# Version: ImageMagick 6.5.4-7 2012-04-10 Q16 OpenMP http://www.imagemagick.org
# Copyright: Copyright (C) 1999-2009 ImageMagick Studio LLC

   }
else {    if ($verbose) {print "Using...\n$convert\n";}}

# check to see if specified input directory exists
unless (-d $in_dir) { die "*Error* Source input directory does not exist: $in_dir \n"; }

# other checks?



# If specified Output directories do not exist, shall we create?




### functions ###

sub usage {
    print $usage;
    print "$@_ \n";
};


print "The end! \n";
__END__
