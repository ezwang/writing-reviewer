class UsersController < ActionController::Base
  before_action :authenticate_user!

  def index
    @users = User.where(status: 'student').where('email LIKE ?', "%#{params[:q]}%").limit(25).map(&:email)
    render json: @users
  end
end
