class UsersController < ApplicationController
  
  def new
    @user = User.new
  end

  def show
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "登録に成功しました！"
      redirect_to @user
    else
      flash.now[:danger] = "登録に失敗しました"
    render 'new', status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def user_params
    params.require(:user).permit(:email, :password)
  end
end
