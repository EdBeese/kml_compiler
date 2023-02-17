# frozen_string_literal: true

require 'polylines'
require 'nokogiri'
require 'pry'

# An extractor for KML files to covert to encoded
class KmlCoordinatesExtractor
  def self.extract(file_path)
    Polylines::Encoder.encode_points(coordinates_mapper(file_path))
  end

  def self.file_iterator(directory_path)
    codes_hash = {}
    Dir.foreach(directory_path) do |filename|
      next unless filename.end_with?('.kml') # skip non-KML files

      file_path = File.join(directory_path, filename)
      codes_hash[filename.scan(/\d+/).join('').to_i] = extract(file_path)
    end
    codes_hash
  end

  def self.coordinates_mapper(file_path)
    binding.pry
    doc = File.open(file_path) { |f| Nokogiri::XML(f) }
    coordinates = doc.css('coordinates').text
    coordinate_strings = coordinates.strip.split(/\s+/)
    coordinate_strings.map { |coord_str| coord_str.split(',')[0..1].map(&:to_f) }
  end
end
