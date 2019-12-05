class CategoriesController < ApplicationController

  def show

    @category = Category.find(params[:id])
    @parent = @category.parent if @category.parent
    @children = @category.children
    @first = Category.where(parent_id:[nil,""])
  end

end
