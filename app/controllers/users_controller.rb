class UsersController < ActionController::Base
  before_action :authenticate_user!

  def index
    @users = User.where(status: 'student').map(&:email)
    render json: @users
  end
end
