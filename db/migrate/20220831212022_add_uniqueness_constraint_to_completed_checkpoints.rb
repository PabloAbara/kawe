class AddUniquenessConstraintToCompletedCheckpoints < ActiveRecord::Migration[7.0]
  def change
    add_index :completed_checkpoints, [:user_id, :checkpoint_id], unique: true
    add_index :resource_ratings, [:user_id, :resource_id], unique: true
  end
end
