require_relative 'kml_coordinate_extractor'
require 'json'
require 'pry'

response = KmlCoordinatesExtractor.file_iterator('kmls')

File.open('output.json', 'w') { |f| f.write(response.to_json) }

# Write further code to manipulate response
