class UsersController < ApplicationController

  def show
  end

  def profile
  end

  def address
  end

  def payment
  end

  def email
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
  end

  def likes
  end

  def items
  end

  def dealing
  end

  def sold
  end

  def buying
  end

  def bought
  end

  def rates
  end
  
end
