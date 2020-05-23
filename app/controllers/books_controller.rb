class BooksController < ApplicationController

before_action :authenticate_user!, only: [:show, :index, :create, :edit, :update, :destroy]

  def show
    @book = Book.find(params[:id])
    @user = @book.user
    @book_new = Book.new
  end

  def index
    @books = Book.all
    @book_new = Book.new
    @user = current_user
  end

  def create
    @book_new = Book.new(book_params)
    @book_new.user_id = current_user.id
    if @book_new.save
    flash[:success] = 'successfully'
    redirect_to book_path(@book_new)
  else
    @books = Book.all
    @user = current_user
    render "index"
  end
end

  def edit
    @user = current_user
    @book_new = Book.find(params[:id])
    if @book_new.user_id != current_user.id
      redirect_to books_path
 end
end

  def update
    @book_new = Book.find(params[:id])
        if @book_new.update(book_params)
           flash[:success] = 'successfully'
           redirect_to book_path(@book_new)
          else
             render 'edit'
        end
          end

  def destroy
    @book = Book.find(params[:id])
    if @book.user_id == current_user.id
      @book.destroy
    redirect_to books_path
  end
end


private
def book_params
  params.require(:book).permit(:title, :body, :user_id)
end
end