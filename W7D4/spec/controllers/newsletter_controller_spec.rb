require 'rails_helper'

RSpec.describe NewsletterController, type: :controller do

  describe "GET #new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #send" do
    it "returns http success" do
      get :send
      expect(response).to have_http_status(:success)
    end
  end

end
