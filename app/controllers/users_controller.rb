class UsersController < ApplicationController

  before_action :correct_user, only:[:edit, :update]

  def show
    @user = User.find(params[:id])
    @books = @user.books
    @book_new = Book.new
  end

  def index
    @user = current_user
    @users = User.all
    @book_new = Book.new
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
     @user = User.find(params[:id])
     if current_user == @user
        if @user.update(user_params)
          flash[:success] = 'successfully'
          redirect_to user_path(@user.id)
        else
          render 'edit'
        end
      end
  end

 

  private

  def correct_user
    @user = User.find(params[:id])
     if current_user != @user
    redirect_to user_path(current_user)
     end
   end

    def user_params
      params.require(:user).permit(:name, :profile_image, :introduction)
    end
end