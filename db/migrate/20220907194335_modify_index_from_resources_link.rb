class ModifyIndexFromResourcesLink < ActiveRecord::Migration[7.0]
  def change
    remove_index :resources, :link
    add_index :resources, [:link, :checkpoint_id], unique: true
  end
end
