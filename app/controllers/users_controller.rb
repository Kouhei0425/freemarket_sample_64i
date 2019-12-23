class UsersController < ApplicationController

  def show
  end

  def profile
    @user = User.find_by(id: current_user.id)
  end

  def address
    @user = User.find_by(id: current_user.id)
    @address = Address.find_by(user_id: current_user.id)
  end

  def payment
  end

  def email
    @user = User.find_by(id: current_user.id)
  end

  def identification
    @user = User.find(params[:id])
  end

  def logout
  end

  def news
  end

  def guide
  end

  def contact
  end
 
  def todo
    @user = User.find_by(id: current_user.id)
  end

  def likes
    @user = User.find_by(id: current_user.id)
  end

  def items
    @user = User.find_by(id: current_user.id)
  end

  def dealing
    @user = User.find_by(id: current_user.id)
  end

  def sold
    @user = User.find_by(id: current_user.id)
  end

  def buying
    @user = User.find_by(id: current_user.id)
  end

  def bought
    @user = User.find_by(id: current_user.id)
  end

  def rates
    @user = User.find_by(id: current_user.id)
  end
  
end
