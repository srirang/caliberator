class Datum < ActiveRecord::Base
  attr_accessible :book, :format, :name, :uncompressed_size
end
