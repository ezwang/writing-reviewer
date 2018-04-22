class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def check_teacher!
    redirect_to root_path, alert: 'Only teachers are allowed to view this page!' unless current_user.teacher?
  end

  def check_student!
    redirect_to root_path, alert: 'Only students are allowed to view this page!' unless current_user.student?
  end
end
