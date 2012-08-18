class Book < ActiveRecord::Base
  attr_accessible :summary, :title, :book_authors_attributes, :artist_first_name, :artist_last_name

  has_many :book_authors
  has_many :authors, :through => :book_authors

  accepts_nested_attributes_for :book_authors, allow_destroy: true
  accepts_nested_attributes_for :authors, allow_destroy: true

  def author_first_name
    self.author.try(:first_name)
  end

  def author_first_name=(str)
    author = Author.find_or_create_by_name(str)
    self.author_id = author.id
  end

  def author_last_name
    self.author.try(:last_name)
  end

  def author_last_name=(str)
    author = Author.find_or_create_by_name(str)
    self.author_id = author.id
  end

end
