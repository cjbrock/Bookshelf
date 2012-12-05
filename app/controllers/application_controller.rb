class ApplicationController < ActionController::Base
  protect_from_forgery

  #before_filter :login_required

  def login_required
    redirect_to login_path, :notice => "Please sign in" unless logged_in?
  end

  def logged_in?
    current_user ? true : false
    #!! current_user
  end

  private

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def random_book
    @random_book ||= get_random_book
  end

  def get_random_book
    book = nil
    while book.nil?
      generate_random_book_array if session[:random_book_ids].blank?
      book_id = session[:random_book_ids].slice!(0)
      book = Book.find_by_id(book_id)
    end
    book
  end

  def generate_random_book_array
    session[:random_book_ids] = Book.select(:id).all.collect(&:id).sort_by{rand}
  end


  helper_method :current_user, :random_book
end
