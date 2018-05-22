require 'rails_helper'

RSpec.describe Advertisement, type: :model do
  let (:ad) {Advertisement.create!}

  describe "attributes" do

    it "should have a title attribute" do

      expect(ad).to respond_to :title
    end

    it "should have a copy attribute" do

      expect(ad).to respond_to :copy
    end

    it "should have a price attribute" do

      expect(ad).to respond_to :price
    end
  end
end
