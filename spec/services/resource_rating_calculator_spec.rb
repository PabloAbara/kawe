require "rails_helper"

RSpec.describe ResourceRatingCalculator do
  let!(:user) { create(:user) }
  let!(:roadmap) { create(:roadmap) }
  let!(:checkpoint) { create(:checkpoint, roadmap: roadmap) }

  describe "get_resources_with_average" do
    context "when checkpoint has no resources" do
      it "returns empty array" do
        response = described_class.get_resources_with_average(checkpoint)

        expect(response).to be_empty
      end
    end

    context "when a resource has no ratings" do
      let!(:resource) { create(:resource, checkpoint: checkpoint) }

      it "returns 0 on average rating" do
        response = described_class.get_resources_with_average(checkpoint)

        expect(response).to eq([{
                                 id: resource.id,
                                 title: resource.title,
                                 link: resource.link,
                                 average_rating: 0
                               }])
      end
    end

    context "with many resources and ratings" do
      it "returns every average"
      it "sorts correctly"
    end
  end
end
