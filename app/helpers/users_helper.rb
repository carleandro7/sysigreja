module UsersHelper
  def listUsersAll
    @users = User.all.order(:nome)
  end
end
