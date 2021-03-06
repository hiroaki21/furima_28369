class ItemsController < ApplicationController
  before_action :set_login, only: [:new, :create, :edit, :update, :destroy]
  before_action :search_item, only: [:show, :edit, :update, :destroy]

  def index
    @items = Item.all
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to :root
    else
      render :new
    end
  end

  def show
  end

  def edit
    redirect_to :root unless current_user.id == @item.user_id
  end

  def update
    if @item.update(item_params)
      render :show
    else
      render :edit
    end
  end

  def destroy
    if @item.destroy
      redirect_to :root
    else
      render :show
    end
  end

  private

  def item_params
    params.require(:item).permit(:title, :image, :introduce, :category_id,
                                 :status_id, :fee_burden_id, :ship_origin_id,
                                 :ship_date_id, :price).merge(user_id: current_user.id)
  end

  def set_login
    unless user_signed_in?
      flash[:alert] = 'You need to sign in or sign up before continuing.'
      redirect_to '/users/sign_in'
    end
  end

  def search_item
    @item = Item.find(params[:id])
  end
end
