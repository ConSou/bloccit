require 'rails_helper'

RSpec.describe SponsoredPost, type: :model do
  let(:name) { RandomData.random_sentence }
  let(:description) { RandomData.random_paragraph }
  let(:title) { RandomData.random_sentence }
  let(:body) { RandomData.random_paragraph }

  let(:topic) { Topic.create!(name: name, description: description)}
  let(:my_sponsored_post) {topic.sponsored_posts.create!(title: title, body: body, price: 10)}

  it { is_expected.to belong_to(:topic) }

  describe "attributes" do

    it "has attributes title, body, price" do

      expect(my_sponsored_post).to have_attributes(title: title, body: body, price: 10)
    end
  end
end
