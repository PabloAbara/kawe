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
    let!(:checkpoint) { create(:checkpoint, roadmap: roadmap) }

    context "with valid checkpoint_id" do 
      it "creates a completed checkpoint" do
        expect{
          post roadmap_complete_checkpoint_path(roadmap,checkpoint_id: checkpoint.id)}.to change(CompletedCheckpoint,:count).by(1)
      end
    end 

    context "without checkpoint_id" do 
      it do
        expect{
          post roadmap_complete_checkpoint_path(roadmap)}.to change(CompletedCheckpoint,:count).by(0)
      end
    end

    context "without valid checkpoint_id" do 
      before do
        checkpoint.delete
      end
      
      it do
        expect{
          post roadmap_complete_checkpoint_path(roadmap,checkpoint_id: checkpoint.id)}.to change(CompletedCheckpoint,:count).by(0)
      end
    end    
  end

  describe "delete uncomplete_checkpoint" do
    let!(:checkpoint) { create(:checkpoint, roadmap: roadmap) }
    let!(:completed_checkpoint) { create(:completed_checkpoint, checkpoint: checkpoint, user: user) }
    
    context "with existing completed_checkpoint" do
      it do

        expect{
          delete roadmap_uncomplete_checkpoint_path(roadmap,checkpoint_id: checkpoint.id)}.to change(CompletedCheckpoint,:count).by(-1)
      end
    end

    context "without existing completed_checkpoint" do
      before do 
        completed_checkpoint.delete
      end

      it do
        
        expect{
          delete roadmap_uncomplete_checkpoint_path(roadmap, checkpoint_id: checkpoint.id)}.to change(CompletedCheckpoint,:count).by(0)
      end
    end

    context "without checkpoint_id" do
      it do

        expect{
          delete roadmap_uncomplete_checkpoint_path(roadmap)}.to change(CompletedCheckpoint,:count).by(0)
      end
    end
    
    context "without valid checkpoint_id" do
      let!(:new_checkpoint) { create(:checkpoint, title: "New Checkpoint") }

      it do

        expect{
          delete roadmap_uncomplete_checkpoint_path(roadmap, roadmap: roadmap,  checkpoint_id: new_checkpoint.id)}.to change(CompletedCheckpoint,:count).by(0)
      end
    end    
  end
end