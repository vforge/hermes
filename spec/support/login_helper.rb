module LoginHelper
  def login(user)
    request.session[:user_id] = user.id
  end

  def current_user
    User.find(request.session[:user_id])
  end

  def login_user
    post_via_redirect join_path, email: FactoryGirl.create(:user).email, password: 'password'
  end

  def login_admin
    post_via_redirect join_path, email: FactoryGirl.create(:user, :admin).email, password: 'password'
  end

  def logout
    if current_user.present?
      get logout_path
    end
  end
end
