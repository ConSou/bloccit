require 'rails_helper'
include RandomData

RSpec.describe AdvertisementsController, type: :controller do
  let (:ad) {Advertisement.create!(title: "New Awesome Product", copy: "You should buy this!", price: 100)}

  describe "GET #index" do

    it "returns http success" do

      get :index
      expect(response).to have_http_status(:success)
    end

    it "assigns ad to @advertisements" do

      get :index
      expect(assigns(:advertisements)).to eq([ad])
    end
  end

  describe "GET #show" do

    it "returns http success" do

      get :show, params: {id: ad.id}
      expect(response).to have_http_status(:success)
    end

    it "renders the #show view" do

      get :show, params: {id: ad.id}
      expect(response).to render_template :show
    end

    it "assigns ad to @advertisements" do

      get :show, params: {id: ad.id}
      expect(assigns(:advertisements)).to eq(ad)
    end
  end

  describe "GET #new" do

    it "returns http success" do

      get :new
      expect(response).to have_http_status(:success)
    end

    it "renders the #new view" do

      get :new
      expect(response).to render_template :new
    end

  end

  describe "GET #create" do

    it "returns http success" do

      get :create
      expect(response).to have_http_status(:success)
    end

    it "renders the #create view" do

      get :create
      expect(response).to render_template :create
    end

  end

  describe "POST #create"do

    it "adds one to total number of advertisements" do

      expect{post :create, advertisement: {title: RandomData.random_sentence, copy: RandomData.random_paragraph, price: 10}}.to
      change(Advertisement, :count).by(1)
    end

    it "it assigns the new advertisement to @advertisement" do

      post :create, advertisement: {title: RandomData.random_sentence, copy: RandomData.random_paragraph, price: 10}
      expect(assigns(:advertisement)).to eq(advertisement.last)
    end

    it "redirects user to new ad" do

      post :create, advertisement: {title: RandomData.random_sentence, copy: RandomData.random_paragraph, price: 10}
      expect(response).to redirect_to Advertisement.last
    end
  end
end
