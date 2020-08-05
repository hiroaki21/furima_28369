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

  def create
    Item.create(item_params)
    redirect_to :root
  end

  private
  def item_params
    params.require(:item).permit(:title,:image,:introduce,:category_id,
                                :status_id,:fee_burden_id,:ship_origin_id,
                                :ship_date_id,:price).merge(user_id:current_user.id)
  end
end
