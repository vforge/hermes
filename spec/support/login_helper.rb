module LoginHelper
  def login(user)
    request.session[:user_id] = user.id
  end

  def current_user
    User.find(request.session[:user_id])
  end

  def login_user
    u = FactoryGirl.create(:user)

    post join_path(email: u.email, password: 'password')
  end

  def login_admin
    a = FactoryGirl.create(:user, :admin)

    post join_path(email: a.email, password: 'password')
  end

  def logout
    if current_user.present?
      get logout_path
    end
  end
end
