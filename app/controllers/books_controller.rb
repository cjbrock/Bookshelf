class BooksController < ApplicationController
  def random
    
  end
  
  def give_another_recommendation

  end

  def index
    @books = Book.all
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @books }
    end
  end

  def show
    @book = Book.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @book }
    end
  end

  def new
    @book = Book.new
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @book }
    end
  end

  def edit
    @book = Book.find(params[:id])
  end

  def create
    @book = Book.new(params[:book])
    respond_to do |format|
      if @book.save
        format.html { redirect_to @book, notice: "There's always room for more books." }
        format.json { render json: @book, status: :created, location: @book }
      else
        format.html { render action: "new" }
        format.json { render json: @book.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @book = Book.find(params[:id])
    respond_to do |format|
      if @book.update_attributes(params[:book])
        format.html { redirect_to @book, notice: "Book updated!" }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @book.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy

    respond_to do |format|
      format.html { redirect_to books_url }
      format.json { head :no_content }
    end
  end

end
