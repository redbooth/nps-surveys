module AuthenticatedTestHelper
  protected

  def login_as(user, *args)
    user = ensure_user_for_login(user, *args)
    session[:user_id] = user.id
    user
  end

  protected

  def ensure_user_for_login(user, *args)
    FactoryGirl.create(user, *args)
  end
end
