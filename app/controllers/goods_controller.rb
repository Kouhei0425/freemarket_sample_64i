class GoodsController < ApplicationController
  before_action :move_to_sign_up, except: :show
  def show
    @good = Good.find(params[:id])
    @user_goods = @good.user.goods.first(6)
    if @good.categories.length == 3
      @category = @good.categories[2]
      @category_goods = @good.categories[2].goods.first(6)
    else
      @category = @good.categories[1]
      @category_goods = @good.categories[1].goods.first(6)
    end
    
  end
  
  def new
    @good = Good.new
    @good.images.build
    @good.category_goods.build
  end

  def create
    if params[:images][:image]
      @good = Good.create(good_params)
    else
      redirect_to :back
    end
    if @good.save
      params[:images][:image].each do |image|
        Image.create(image: image, good_id: @good.id )
      end
      params[:category_ids][:category_id].each do |category_id|
        CategoryGood.create(category_id: category_id, good_id: @good.id)
      end
      redirect_to root_path
    end
    
  end

  def destroy
    @good = Good.find(params[:id])
    @good.destroy
    redirect_to user_path(current_user.id)
  end

  def edit
    @good = Good.find(params[:id])
    gon.good = @good
    gon.good_images = @good.images
  end




  def selledit
    @good = Good.find(params[:id])
    
  end


  def update
    @good = Good.find(params[:id])
    @good.update(good_params)
    if @good.update(good_params)
      params[:images][:image].each do |image|
        if image.present?
          Image.create(image: image, good_id: @good.id)  
        end
      end

      params[:destroy][:ids].each do |id|
        if id.present?
          image = Image.find(id) 
          image.destroy 
        end
      end
      
      categories = CategoryGood.where( good_id: @good.id)
      categories.each do |category|
        category.destroy
      end
      params[:category_ids][:category_id].each do |category_id|
        CategoryGood.create(category_id: category_id, good_id: @good.id)
      end
    end
    redirect_to root_path
  end


  private

  def good_params
    params.require(:good).permit(:name, :explain, :size, :price, :method, :ship, :burden, 
      :status, :brand_id, :area_id, :user_id, category_ids: [])
  end

  def move_to_sign_up
    redirect_to new_user_session_path unless user_signed_in?
  end
  
end


