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
    @study_time = params[:item][:study_time]
    @item = current_user.items.build(item_params.merge(category: @category))
    if @item.save
      # flash[:success] = "#{@category.name}に#{@item.name}を#{@study_time}分で追加しました！"
      # redirect_to items_url(month: @month)
      respond_to do |format|
        format.html { flash[:success] = "#{@category.name}に#{@item.name}を#{@study_time}分で追加しました！"
        redirect_to items_url(month: @month) }
        format.js # create.js.erb ビューファイルを返す
      end
    else
      # flash.now[:danger] = "項目追加に失敗しました"
      # render 'new', status: :unprocessable_entity
      respond_to do |format|
        format.html { render :new }
        format.js   { render partial: 'shared/errors', locals: { object: @item } }
      end
    end
  end

  def update
    @item = Item.find_by(id: params[:id])
    month = @item.month
    @item.assign_attributes(item_params)
    if @item.save
      flash[:success] = "#{@item.name}の学習時間を更新しました"
      redirect_to items_url(month: month)
    else
      flash.now[:danger] = "#{@item.name}の学習時間更新に失敗しました"
      render 'new', status: :unprocessable_entity
    end
  end

  def destroy
    month = params[:month]
    item = Item.find_by(id: params[:id]).destroy!
    flash[:success] = "#{item.name}を削除しました"
    redirect_to items_url(month: month)
  end

  private

    def item_params
      params.require(:item).permit(:name, :study_time, :month)
    end
end