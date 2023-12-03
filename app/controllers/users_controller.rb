class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      flash[:success] = "登録に成功しました！"
      redirect_to root_path
    else
      flash.now[:danger] = "登録に失敗しました"
      render 'new', status: :unprocessable_entity
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.avatar_image.attach(params[:user][:avatar_image])
    if @user.update(user_params)
      flash[:success] = "情報を変更しました"
      redirect_to root_path
    else
      flash.now[:danger] = "編集に失敗しました"
      render 'edit', status: :unprocessable_entity
    end
  end

  def destroy
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :profile_text, :avatar_image)
  end
end
