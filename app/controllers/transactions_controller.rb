class TransactionsController < ApplicationController
  before_action :set_login, only: [:index,:create]

  def index
    @transaction = BuyerInfo.new
    @item = Item.find(params[:item_id])
    redirect_to :root unless current_user.id != @item.user_id
    redirect_to :root unless @item.deal.blank?
  end

  def create
    @item = Item.find(params[:item_id])
    @transaction=BuyerInfo.new(transaction_params)
    if @transaction.valid?
      pay_item
      @transaction.save
      return redirect_to :root
    else
      render :index
    end
  end

  def set_login
    unless user_signed_in?
      flash[:alert] = 'You need to sign in or sign up before continuing.'
      redirect_to '/users/sign_in'
    end
  end

  private
  def transaction_params
    params.require(:buyer_info).permit(:postal_num,:pref_id,:city,:house_num,:building,:tel_num,:item_id).merge(user_id: current_user.id).merge(item_id:@item.id).merge(token:params[:token])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,
      card: params[:token], 
      currency:'jpy'     
    )
  end
end
