module SessionsHelper

  def sign_in(user)
    token = User.new_token
    cookies.permanent[:token] = token
    user.update_attribute(:remember_token, User.digest(token))
    self.current_user = user
  end

  def current_user=(user)
    @current_user = user
  end

  def current_user
    token = User.digest(cookies[:token])
    @current_user ||= User.find_by(remember_token: token)
  end

  def current_user?(user)
    user == current_user
  end

  def signed_in?
    !current_user.nil?
  end

  def sign_out
    current_user.update_attribute(:remember_token, User.digest(User.new_token))
    cookies.delete(:remember_token)
    self.current_user = nil
  end

  def signed_in_user
    unless signed_in?
      redirect_to login_path, notice: "Please sign in."
    end
  end

end
