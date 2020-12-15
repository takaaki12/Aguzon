class Aguzon::UserSessionsController < ApplicationController
  helper 'spree/base'

  include Spree::Core::ControllerHelpers::Auth
  include Spree::Core::ControllerHelpers::Common
  include Spree::Core::ControllerHelpers::Order
  include Spree::Core::ControllerHelpers::Store

  before_action :set_current_order
  layout 'application'

  def new
  end

  def create
    authenticate_spree_user!

    if spree_user_signed_in?
      flash[:success] = Spree.t(:logged_in_succesfully)
      redirect_to aguzon_path
    else
      flash.now[:error] = t('devise.failure.invalid')
      render 'aguzon/user_sessions/new.html.erb'
    end
  end

  def destroy
    log_out
    redirect_to aguzon_path
  end
end
