class Book < ActiveRecord::Base
  has_many :datum, :foreign_key => "book"
  has_one :comment, :foreign_key => "book"
  has_and_belongs_to_many :authors, :join_table => "books_authors_link", :foreign_key => "book", :association_foreign_key => "author"

  @@library_basepath = "#{Rails.root}/public/Calibre Library"
  @@image_basepath = "/Calibre Library"

  def get_filepath
    return "#{get_filedirectory}/#{get_filename}"
  end

  def get_filedirectory
    return "#{get_library_basepath}/#{path}"
  end

  def get_library_basepath
    return @@library_basepath
  end

  def get_filename
    return "#{datum[0].name}.#{get_extension.downcase}"
  end

  def get_extension
    return "#{datum[0].format}"
  end

  def get_image_name
    if has_cover?
      return "cover.jpg"
    end
  end

  def get_summary
    if (comment == nil)
      ""
    else
      comment.text
    end
      
  end

  def get_title
    title.strip.titleize
  end

  def get_author
    author_sort.titleize
  end

  def get_author_names
    author_names = authors.collect{|author| author.name}
  end

  def get_thumbnail
    if has_cover
      "#{@@image_basepath}/#{path}/cover.jpg"
    else
      ""
    end
  end

end
