# KML Extractor

This is a very basic Ruby app that iterates over a directory of KML files and
returns a hash that provides the reference number contained within the file name
and a Encoded Polyline Algorithm Format string, which can be used to render a
geographical polygon

# Requirements
This app was built for a specific function, and will accept KML files that
contain a reference number within the file name.

# How to Use
Add the KML files that you wish to convert into Encoded Polyline Algorithm
Format into the kmls directory and run the file run.rb.  As written, this will
assign the generated hash to a variable called 'response'.  You can write
further code in the run.rb file to manipulate this variable for your needs.
