class Aguzon::UsersController < Aguzon::StoreController
  layout 'application'

  def create
    @user = Spree::User.new(user_params)
    if @user.save

      if current_order
        session[:guest_token] = nil
      end

      flash[:success] = "ようこそ「おくだいら」へ！!"
      redirect_to aguzon_home_index_path
    else
      render 'new'
    end
  end

  # def show
    # @orders = @user.orders.complete.order('completed_at desc')
    # redirect_to aguzon_cart_path
  # end

  def new
    @user = Spree::User.new
  end

  def edit
    @user = Spree::User.find(params[:id])
  end

  # def update
    # if @user.update(user_params)
      # if params[:user][:password].present?
        # this logic needed b/c devise wants to log us out after password changes
        # Spree.user_class.reset_password_by_token(params[:user])
        # if Spree::Auth::Config[:signout_after_password_change]
          # sign_in(@user, event: :authentication)
        # else
          # bypass_sign_in(@user)
        # end
      # end
      # redirect_to spree.account_url, notice: Spree.t(:account_updated)
    # else
      #render :edit
    # end
  # end

  private

  def user_params
    params.permit(:email, :password, :password_confirmation)
  end
end
