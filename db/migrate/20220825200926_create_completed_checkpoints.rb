class CreateCompletedCheckpoints < ActiveRecord::Migration[7.0]
  def change
    create_table :completed_checkpoints do |t|
      t.references :user, null: false, foreign_key: true
      t.references :checkpoint, null: false, foreign_key: true

      t.timestamps
    end
  end
end
