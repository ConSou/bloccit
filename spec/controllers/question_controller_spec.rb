require 'rails_helper'

RSpec.describe QuestionController, type: :controller do
  let(:my_question) {Question.create!(title: "First Question", body: "This is the first question?", resolved: false)}

  describe "GET #index" do

    it "returns http success" do

      get :index
      expect(response).to have_http_status(:success)
    end

    it "assigns my_question to @questions" do

      get :index
      expect(assigns(:questions)).to eq([my_question])
    end
  end

  describe "GET show" do

    it "returns http success" do

      get :show, params: {id: my_question.id}
      expect(response).to have_http_status(:success)
    end

    it "renders the show view" do

      get :show, params: {id: my_question.id}
      expect(response).to render_template :show
    end
  end

  describe "GET new" do

    it "returns http success" do

      get :new
      expect(response).to have_http_status(:success)
    end

    it "renders the new view" do

      get :new
      expect(response).to render_template :new
    end

    it "instantiates @question" do

      get :new
      expect(assigns(:question)).not_to be_nil
    end
  end
end
