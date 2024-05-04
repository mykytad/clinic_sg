class CategoriesController < ApplicationController
  def index
    @categories = Category.all
  end

  def show
    @category = Category.find(params[:id])
    @doctors = Doctor.where(:category_id => params[:id])
  end
end
