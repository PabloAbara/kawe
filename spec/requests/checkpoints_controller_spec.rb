require "rails_helper"

RSpec.describe CheckpointsController, type: :request do
  describe "GET/show" do
    let!(:user) { create(:user) }
    let!(:roadmap) { create(:roadmap) }
    let!(:checkpoint) { create(:checkpoint, roadmap: roadmap) }

    before do
      sign_in user
    end

    context "when accesing to the checkpoint view" do
      it "gets resources" do
        get roadmap_checkpoint_path(roadmap, checkpoint)
        expect(response).to have_http_status(200)
        expect(response.body).to include("Recurso")
        expect(response.body).to include("Link")
        expect(response.body).to include("Current Avg Rating")
        expect(response.body).to include("Rate / Your Rating")
      end
    end
  end
end
