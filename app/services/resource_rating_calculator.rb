class ResourceRatingCalculator < ApplicationController

  #recibe un listado de resources y retorna un array con los pares [resource,rating]
  def self.calculate_resources_rating(resources)
    resource_with_rating = []
    resources.each do |resource|
      resource_with_rating.push([resource,calculate_resource_rating(resource)])
    end

    p "****************************************************************HOLA****************************************************************"
  end

  def calculate_resource_rating(resource)
    #ToDo: calcular el average para cada resource
    
    #calculation_basis = .
    #zombies = ResourceRating.filter_by(:id) if params[:weapons_ids].present?

  end

end