class Datum < ActiveRecord::Base
  attr_accessible :book, :format, :name, :uncompressed_size

  @@mimetypes = { "CHM" => "application/vnd.ms-htmlhelp", "DJVU" => "image/vnd.djvu", "DOC" => "application/vnd.ms-word.document.macroenabled.12", "EPUB" => "application/epub+zip", "LIT" => "application/x-ms-reader", "MOBI" => "application/x-mobipocket-ebook", "PDB" => "application/vnd.palm", "PDF" => "application/pdf", "PRC" => "application/x-mobipocket-ebook", "RTF" => "application/rtf"}

  def show_mime
  	puts @@mimetypes
  end

  def get_mime_type
  	return @@mimetypes[format.upcase]
  end
end
