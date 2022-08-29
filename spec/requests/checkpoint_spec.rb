require 'rails_helper'

RSpec.describe "Checkpoints", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get "/checkpoint/index"
      expect(response).to have_http_status(:success)
    end
  end

end
