class UsersController < ApplicationController
  def index
    @users = Users.find(:all)
  end

  def show
    id = params[:id]
    @user = User.find(id)
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      sign_in @user
      flash[:success] = "Your account was successfully created"
      redirect_to @user
    else
      render 'new'
    end
  end

  def new
    @user = User.new

  end

end
