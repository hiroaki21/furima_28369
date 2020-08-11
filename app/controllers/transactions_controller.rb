class TransactionsController < ApplicationController
  before_action :set_login, only: [:index,:create]

  def index
    @transaction = Transaction.new
    @item = Item.find(params[:item_id])
    redirect_to :root unless current_user.id != @item.user_id
    redirect_to :root unless @item.deal.blank?
  end

  def create
    @item = Item.find(params[:item_id])
    @transaction=Transaction.new(user_id: transaction_params[:user_id],item_id: transaction_params[:item_id])
    if @transaction.valid?
      pay_item
      @transaction.save
      return redirect_to root_path
    else
      render 'index'
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
    params.permit(:token).merge(user_id: current_user.id).merge(item_id:@item.id)
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,
      card: transaction_params[:token], 
      currency:'jpy'     
    )
  end
end
