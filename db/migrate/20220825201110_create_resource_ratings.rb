class CreateResourceRatings < ActiveRecord::Migration[7.0]
  def change
    create_table :resource_ratings do |t|
      t.references :user, null: false, foreign_key: true
      t.references :resource, null: false, foreign_key: true
      t.integer :rating

      t.timestamps
    end
  end
end
