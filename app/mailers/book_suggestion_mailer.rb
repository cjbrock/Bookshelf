class BookSuggestionMailer < ActionMailer::Base
  default from: "services@flatironschool.com"

  def book_suggestion(message)
    @message = message
    mail(:to => "corinna.brock@gmail.com", :subject => "Book Suggestion")
  end
end
