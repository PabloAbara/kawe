# frozen_string_literal: true

class ResourceRatingCalculator
  def self.calculate_resource_rating(resource)
    ResourceRating.where(resource_id: resource.id).average(:rating)
  end
end
