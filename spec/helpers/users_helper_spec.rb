require 'rails_helper'

RSpec.describe UsersHelper, type: :helper do
  let(:user) {create(:user)}
  let(:topic) {create(:topic)}

  describe "#show_posts_if_any" do

    it "will show user has submitted no posts" do
      expect(helper.show_posts_if_any(user)).to eq("<p>#{user.name} has not submitted any posts</p>")
    end

    context "user created post" do
    before do
      @post = create(:post, topic: topic, user: user)
    end

    it "will show user posts if they have created posts" do
      expect(helper.show_posts_if_any(user)).to eq(render partial: 'posts/post', locals: {post: @post})
    end
    end
  end

  describe "#show_comments_if_any" do

    it "will show user has submitted no comments" do
      expect(helper.show_comments_if_any(user)).to eq("<p>#{user.name} has not submitted any comments</p>")
    end

    context "user created comment" do
    before do
      @comment = create(:comment, user: user)
    end

    it "will show user comments if they have created comments" do
      expect(helper.show_comments_if_any(user)).to eq(render partial: 'comments/comment', locals: {comment: @comment})
    end
  end
  end
end
