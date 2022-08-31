class AddRatingValidation < ActiveRecord::Migration[7.0]
  def change
    change_column_null :resource_ratings, :rating, false
  end
end
