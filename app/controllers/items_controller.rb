class ItemsController < ApplicationController
  before_action :logged_in_user, only: [:index, :new, :create, :update, :destroy]
  include SessionsHelper

  def index
    @categories = Category.all
    @year = params[:year]
    @month = params[:month]
  end

  def new
    @category = Category.find_by(id: params[:category_id])
    @item = Item.new
    @year = params[:year]
    @month = params[:month]
  end

  def create
    @category = Category.find_by(id: params[:category_id])
    @year = params[:item][:year]
    @month = params[:item][:month]
    @study_time = params[:item][:study_time]
    @item = current_user.items.build(item_params.merge(category: @category))
    if @item.save
      flash.now[:success] = "#{@category.name}に#{@item.name}を#{@study_time}分で追加しました！"
      render 'new', status: :created
    else
      flash.now[:danger] = "項目追加に失敗しました"
      render 'new', status: :unprocessable_entity
    end
  end

  def update
    @item = Item.find_by(id: params[:id])
    year = @item.year
    month = @item.month
    @item.assign_attributes(item_params)
    if @item.save
      flash[:success] = "#{@item.name}の学習時間を更新しました"
      redirect_to items_url(year: year, month: month)
    else
      flash.now[:danger] = "#{@item.name}の学習時間更新に失敗しました"
      render 'new', status: :unprocessable_entity
    end
  end

  def destroy
    year = params[:year]
    month = params[:month]
    item = Item.find_by(id: params[:id]).destroy!
    flash[:success] = "#{item.name}を削除しました"
    redirect_to items_url(year: year, month: month)
  end

  private

    def item_params
      params.require(:item).permit(:name, :study_time, :year, :month)
    end
end