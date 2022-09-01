class AddIndexToResourcesLink < ActiveRecord::Migration[7.0]
  def change
    add_index :resources, :link, unique: true
  end
end
