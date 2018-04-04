module ApplicationHelper
  def authenticate_teacher!
    redirect_to root_path unless current_user.teacher?
  end

  def authenticate_student!
    redirect_to root_path unless current_user.student?
  end
end
