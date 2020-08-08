class TransactionsController < ApplicationController
  before_action :set_login, only: [:index]
  def index
  end

  def set_login
    unless user_signed_in?
      flash[:alert] = 'You need to sign in or sign up before continuing.'
      redirect_to '/users/sign_in'
    end
  end
end
