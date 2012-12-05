class MessagesController < ApplicationController
  def new
    @message = Message.new
  end

  def create
    @message = Message.new(params[:message])
    if @message.valid?
      BookSuggestionMailer.book_suggestion(@message).deliver
      redirect_to root_url, notice: "Suggestion received! We may use it if it doesn't suck."
    else
      redirect_to root_url, notice: "Please fill out the whole form. Like, everything. Even your name."
    end
  end
end