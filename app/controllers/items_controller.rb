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
end