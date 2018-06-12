module UsersHelper
  def no_posts?
    @user.posts.count == 0
  end
end
