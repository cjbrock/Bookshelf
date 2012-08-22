class Author < ActiveRecord::Base
  attr_accessible :bio, :first_name, :last_name, :book_authors_attributes

  has_many :book_authors
  has_many :books, :through => :book_authors

  accepts_nested_attributes_for :book_authors, allow_destroy: true
  accepts_nested_attributes_for :books, allow_destroy: true

  def full_name
    "#{self.first_name} #{self.last_name}"
  end
end
