require 'rails_helper'

RSpec.describe HomeController, type: :controller do

  describe "GET #hackers" do
    it "returns http success" do
      get :hackers
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #pros" do
    it "returns http success" do
      get :pros
      expect(response).to have_http_status(:success)
    end
  end

end
