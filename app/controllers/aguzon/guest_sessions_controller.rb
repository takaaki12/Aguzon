class Aguzon::GuestSessionsController < ApplicationController
  def guest_session
    user = Spree::User.find_or_create_by(email: 'guest@okudaira.com') do |spree_user|
      spree_user.password = SecureRandom.urlsafe_base64
    end
    sign_in user
    flash[:success] = 'ゲストユーザーでログインしました! よろしくお願いします〜♪♪'
    redirect_to aguzon_path
  end

  def destroy
    sign_out
    flash[:success] = 'ありがとうございました！　またのお越しをお待ちしております♪♪'
    redirect_to aguzon_path
  end
end
