require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { User.create!(name: "Bloccit User", email: "user@bloccit.com", password: "password") }

   it { is_expected.to have_many(:posts) }
   it{ is_expected.to have_many(:comments)}
   it{ is_expected.to have_many(:votes)}
   it{ is_expected.to have_many(:favorites)}

   it { is_expected.to validate_presence_of(:name) }
   it { is_expected.to validate_length_of(:name).is_at_least(1) }

   it { is_expected.to validate_presence_of(:email) }
   it { is_expected.to validate_uniqueness_of(:email) }
   it { is_expected.to validate_length_of(:email).is_at_least(3) }
   it { is_expected.to allow_value("user@bloccit.com").for(:email) }

   it { is_expected.to validate_presence_of(:password) }
   it { is_expected.to have_secure_password }
   it { is_expected.to validate_length_of(:password).is_at_least(6) }

   describe "attributes" do

     it "responds to role" do

       expect(user).to respond_to(:role)
     end

     it "responds to admin?" do

       expect(user).to respond_to(:admin?)
     end

     it "responds to member?" do

       expect(user).to respond_to(:member?)
     end

     it "should have name and email attributes" do

       expect(user).to have_attributes(name: "Bloccit User", email: "user@bloccit.com")
     end
   end

   describe "roles" do

     it "is member by default" do

       expect(user.role).to eq("member")
     end

     context "member user" do

       it "returns true for #member?" do

         expect(user.member?).to be_truthy
       end

       it "returns false for #admin?" do

         expect(user.admin?).to be_falsey
       end
     end

     context "admin user" do
       before do
         user.admin!
       end

       it "returns false for member" do

         expect(user.member?).to be_falsey
       end

       it "returns true for admin" do

         expect(user.admin?).to be_truthy
       end
     end
   end

   describe "#favorite_for(post)" do
     before do
       topic = Topic.create!(name: RandomData.random_sentence, description: RandomData.random_paragraph)
       @post = topic.posts.create!(title: RandomData.random_sentence, body: RandomData.random_paragraph, user: user)
     end

     it "returns nil if the user hasn't favorited the post" do

       expect(user.favorite_for(@post)).to be_nil
     end

     it "returns the approperate favorite if it exists" do

       favorite = user.favorites.where(post: @post).create
       expect(user.favorite_for(@post)).to eq(favorite)
     end
   end


end
