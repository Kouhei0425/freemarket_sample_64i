class CategoriesController < ApplicationController
  def show
    @category = Category.find(params[:id])
    @children = @category.children
    @parent = @category.parent
  end  
end
