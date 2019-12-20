class GoodsController < ApplicationController
  before_action :move_to_sign_up, except: :show
  def show
    @good = Good.find(params[:id])
  end
  
  def new
    @good = Good.new
    @good.images.build
    @good.category_goods.build
  end

  def create
    @good = Good.new(good_params)
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

    require 'base64'
    require 'fog-aws'

    gon.good_images_binary_datas = []
    if Rails.env.production?
      client = Aws::S3::Client.new(
                             region: 'ap-northeast-1',
                             access_key_id: Rails.application.credentials.aws[:access_key_id],
                             secret_access_key: Rails.application.credentials.aws[:secret_access_key],
                             )
      @good.images.each do |image|
        binary_data = client.get_object(bucket: 'freemarket-sample-64i-image', key: image.image_url.file.path).body.read
        gon.good_images_binary_datas << Base64.strict_encode64(binary_data)
      end
    else
      @good.images.each do |image|
        binary_data = File.read(image.image.file.file)
        gon.good_images_binary_datas << Base64.strict_encode64(binary_data)
      end
    end
  end




  def selledit
    @good = Good.find(params[:id])
  end


  def update
   
    @good = Good.find(params[:id])
    @good.update(good_params)
    if @good.update(good_params)
      categories = CategoryGood.where( good_id: @good.id)
      categories.each do |category|
        category.destroy
      end
      params[:category_ids][:category_id].each do |category_id|
        CategoryGood.create(category_id: category_id, good_id: @good.id)
      end
    end
      
  end



  private
  def good_params
    params.require(:good).permit(:name, :explain, :size, :price, :method, :ship, :burden, 
      :status, :brand_id, :area_id, :user_id, images_attribute: [:image], category_ids: [])
  end

  def move_to_sign_up
    redirect_to new_user_session_path unless user_signed_in?
  end


end


