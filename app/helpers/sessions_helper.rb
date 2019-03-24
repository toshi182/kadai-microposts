module SessionsHelper
  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  def logged_in?
    # ログインしているときには、trueを返し、していないときにはfalseを返す
    !!current_user
  end
end