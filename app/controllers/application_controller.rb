class ApplicationController < ActionController::Base
  protect_from_forgery

  protected

  def authorize
    unless User.find_by_id(session[:user_id])
      session[:original_url] = request.original_url
      redirect_to login_url
    end
  end
end
