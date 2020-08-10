class TransactionsController < ApplicationController
  before_action :set_login, only: [:index]
  def index
    @transaction = Transaction.new
    @item = Item.find(params[:item_id])
    redirect_to :root unless current_user.id != @item.user_id
  end

  def set_login
    unless user_signed_in?
      flash[:alert] = 'You need to sign in or sign up before continuing.'
      redirect_to '/users/sign_in'
    end
  end
end
