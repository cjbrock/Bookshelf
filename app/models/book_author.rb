class BookAuthor < ActiveRecord::Base
  attr_accessible :title, :body, :book_id, :author_id

  belongs_to :book
  belongs_to :author

  accepts_nested_attributes_for :book, allow_destroy: true
  accepts_nested_attributes_for :author, allow_destroy: true

  def book=(book)
    self.book_id = Book.find_or_create_by_name(book.capitalize).id
  end

end
