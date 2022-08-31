class ResourceRatingCalculator

  def self.calculate_resource_rating(resource)
    ratings = ResourceRating.where(resource_id: resource.id)
    if ratings.any? then ratings.average(:rating).round(2) else nil end
  end

end
