require "rails_helper"

RSpec.describe CheckpointsController, type: :request do
  describe 'GET/show' do
    let!(:user) { create(:user) }
    let!(:roadmap) { create(:roadmap) }
    let!(:checkpoint) { create(:checkpoint, roadmap: roadmap) }

    before do
      sign_in user
    end

    context 'when accesing to the checkpoint view' do
      it 'gets view' do
        get roadmap_checkpoint_path(roadmap, checkpoint) 
        expect(response).to have_http_status(:success)
        expect(response.body).to include("Current Avg Rating")
      end
    end
  end
end