module ApplicationHelper
  def authenticate_teacher!
    redirect_to root unless current_user.teacher?
  end
end
