require 'rails_helper'

RSpec.describe Question, type: :model do
  let (:question) {Question.create!(title: "First Question", body: "This is the first question?", resolved: false)}

  describe "attributes" do

    it "has title, body and resolved attributes" do

      expect(question).to have_attributes(title: "First Question", body: "This is the first question?", resolved: false)
    end
  end
end
