class ItemsController < ApplicationController

  def index
    @categories = Category.all
    @month = params[:month]
  end

  def new
    @category = Category.find_by(id: params[:category_id])
    @item = Item.new
    @month = params[:month]
  end

  def create
    @category = Category.find_by(id: params[:category_id])
    @month = params[:item][:month]
    @item = current_user.items.build(item_params.merge(category: @category))
    if @item.save
      flash[:success] = "項目追加に成功しました"
      redirect_to items_url(month: @month)
    else
      flash.now[:danger] = "項目追加に失敗しました"
      render 'new', status: :unprocessable_entity
    end
  end

  private

    def item_params
      params.require(:item).permit(:name, :study_time, :month)
    end
end