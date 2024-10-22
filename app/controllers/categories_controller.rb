class CategoriesController < ApplicationController
  def index
    @Categories = Category.all
  end

  def new
    @category = Category.new
  end

  # def create
  #   @category = Category.new
  # end

  def show
    @category = Category.find(params[:id])
  end

  private

  # def set_categories
  #   @category = category.find(params[:id])
  # end

  def categories_params
    params.require(:category).permit(:title)
  end
end
