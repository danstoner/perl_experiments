image-resize-rename-forweb
==========================

Mass-rename and resize images for a web site.


Requires:  ImageMagick (convert),
           Perl, Getopt::Long

The premise is that I already have a system of file naming and organizing in place,
this script is to help automate the work.

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
