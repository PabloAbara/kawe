class ResourceRatingCalculator

  def self.get_resources_with_average(checkpoint)
    result = nil
    unless checkpoint.nil?
      result = []
      checkpoint.resources.each do |resource|
        result.push({
          id: resource.id,          
          title: resource.title,
          link: resource.link,
          average_rating: calculate_resource_rating(resource) })
      end
    end
    if result
      result = result.sort_by { |v| v[:average_rating] }.reverse
    end
    result
  end

  private

  def self.calculate_resource_rating(resource)
    ratings = ResourceRating.where(resource_id: resource.id)
    ratings.any? ? ratings.average(:rating).round(2) : 0.0
  end
end
