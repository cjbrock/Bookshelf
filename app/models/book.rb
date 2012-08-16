class Book < ActiveRecord::Base
  attr_accessible :summary, :title, :book_authors_attributes

  has_many :book_authors
  has_many :authors, :through => :book_authors

  accepts_nested_attributes_for :book_authors, allow_destroy: true
  accepts_nested_attributes_for :authors, allow_destroy: true


end
