class ResourceRatingCalculator
  def self.calculate_resource_rating(resource)
    ratings = ResourceRating.where(resource_id: resource.id)
    ratings.any? ? ratings.average(:rating).round(2) : nil
  end
end
