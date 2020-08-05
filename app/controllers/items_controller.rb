class ItemsController < ApplicationController
  def index

  end

  def new
    if user_signed_in?
      @item=Item.new
    else
      flash[:alert] = 'You need to sign in or sign up before continuing.'
      redirect_to "/users/sign_in"
    end
  end
end
