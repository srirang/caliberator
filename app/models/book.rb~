class Book < ActiveRecord::Base
  has_many :datum, :foreign_key => "book"
  has_one :comment, :foreign_key => "book"
  has_and_belongs_to_many :authors, :join_table => "books_authors_link", :foreign_key => "book", :association_foreign_key => "author"
  has_and_belongs_to_many :tags, :join_table => "books_tags_link", :foreign_key => "book", :association_foreign_key => "tag"

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
    "#{@@image_basepath}/#{path}/cover.jpg"
  end

  def is_has_cover
    if has_cover == 1 
      true
    else
      false
    end
  end

  def is_has_tags
    if tags.size > 0
      true
    else
      false
    end
  end

end
