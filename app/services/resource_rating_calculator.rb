class ResourceRatingCalculator

  def self.calculate_resource_rating(resource)
    #TODO: refactor, too many lines
    ratings = ResourceRating.where(resource_id: resource.id)
    unless ratings.empty?
      output = ratings.average(:rating).round(2)
    else
      output = "--"
    end
    output
  end

end
