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
      render "new"
    end
  end
end