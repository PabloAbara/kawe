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
      let!(:user_two) { create(:user) }
      let!(:resource_one) { create(:resource, checkpoint: checkpoint) }

      let!(:user_rating_resource_one) do
        create(:resource_rating, rating: 2, user: user, resource: resource_one)
      end
      let!(:user_two_rating_resource_one) do
        create(:resource_rating, rating: 5, user: user_two, resource: resource_one)
      end

      let!(:resource_two) { create(:resource, checkpoint: checkpoint) }
      let!(:user_rating_resource_two) do
        create(:resource_rating, rating: 3, user: user, resource: resource_two)
      end
      let!(:user_two_rating_resource_two) do
        create(:resource_rating, rating: 5, user: user_two, resource: resource_two)
      end

      it "returns every average" do
        resources_rated = described_class.get_resources_with_average(checkpoint)

        expect(resources_rated.pluck(:average_rating)).to include(3.5)
        expect(resources_rated.pluck(:average_rating)).to include(4)
      end

      it "sorts correctly" do
        resources_rated = described_class.get_resources_with_average(checkpoint)

        expect(
          resources_rated.pluck(:average_rating)
        ).to eq(resources_rated.pluck(:average_rating).sort.reverse)
      end
    end
  end
end
