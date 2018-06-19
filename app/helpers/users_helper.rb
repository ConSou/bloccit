module UsersHelper
  def show_posts_if_any(user)
    if user.posts.count == 0
      "<p>#{user.name} has not submitted any posts</p>".html_safe
    else
       render user.posts
    end
  end

  def show_comments_if_any(user)
    if user.comments.count == 0
      "<p>#{user.name} has not submitted any comments</p>".html_safe
    else
      render user.comments
    end
  end
end
