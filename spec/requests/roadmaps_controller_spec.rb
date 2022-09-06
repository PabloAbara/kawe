require "rails_helper"

RSpec.describe RoadmapsController, type: :request do
  let!(:user) { create(:user) }
  let!(:roadmap) { create(:roadmap) }

  before do
    sign_in user
  end

  describe "index" do
    it do
      get roadmaps_path

      expect(response.body).to include "redirected"
    end
  end

  describe "show" do
    let!(:checkpoint) { create(:checkpoint, roadmap: roadmap) }

    context "with valid roadmap" do 
      it "checks link showing" do
        get roadmap_path(roadmap)
        
        expect(response.body).to include "https://github.com/PabloAbara/kawe"
      end
      it "checks title showing" do 
        get roadmap_path(roadmap)
        
        expect(response.body).to include "Kawe"
      end
    end

    context "with completed checkpoint" do
      let!(:completed_checkpoint) do
        create(:completed_checkpoint, user: user, checkpoint: checkpoint)
      end

      it do
        get roadmap_path(roadmap)

        expect(response.body).to include "Incompleto 👮🏻‍♂️"
      end
    end

    context "without completed checkpoint" do
      it do
        get roadmap_path(roadmap)

        expect(response.body).to include "Completo ✅"
      end
    end
  end

  describe "post complete_checkpoint" do
    context "without valid checkpoint_id" do 
      it do #redirect with error messagex
        post roadmap_complete_checkpoint_path(roadmap)

        expect(response.body).to include "No+encuentra+checkpoint"
        #TODO: ¿Es correcto? 
      end
    end
  end

  describe "delete uncomplete_checkpoint" do
    it "uncomplete_checkpoint_route"
  end
end
