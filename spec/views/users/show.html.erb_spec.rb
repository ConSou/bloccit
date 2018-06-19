require 'rails_helper'
require 'spec_helper'

RSpec.describe "users/show.html.erb", type: :view do
  let(:user) {create(:user)}
  let(:topic) {create(:topic)}
  let(:post) {create(:post)}

  describe "users/show.html.erb favorites" do

    it "displays favorites" do
      @user = user
      assign(:favorite, Favorite.create!(post: post, user: user))
      render
      rendered.should match(post.title)
      rendered.should match(user.name)
    end
  end
end
