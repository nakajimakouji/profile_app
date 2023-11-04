class CategoriesController < ApplicationController
  def index
    debugger
    @category = Categories.all
  end
end