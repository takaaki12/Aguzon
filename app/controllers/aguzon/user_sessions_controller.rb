class Aguzon::UserSessionsController < ApplicationController
  def new
  end

  def create
    user = Spree::User.find_by(params[:email])
    sign_in user
    flash[:success] = 'ログインしました! いらっしゃいませ〜♪♪'
    redirect_to aguzon_path
  end

  def destroy
    sign_out
    flash[:success] = 'ありがとうございました！　またのお越しをお待ちしております♪♪'
    redirect_to aguzon_path
  end
end
