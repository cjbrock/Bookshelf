class Book < ActiveRecord::Base
  attr_accessible :summary, :title, :book_authors_attributes, :author_first_name, :author_last_name, :authors_attributes


  has_many :book_authors
  has_many :authors, :through => :book_authors

  accepts_nested_attributes_for :book_authors, allow_destroy: true
  accepts_nested_attributes_for :authors, allow_destroy: true

  def author_names
    names = self.authors.collect(&:full_name)
    return "Anonymous" if names.blank?
    names.to_sentence
  end

end
