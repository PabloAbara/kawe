# frozen_string_literal: true

class CreateCheckpoints < ActiveRecord::Migration[7.0]
  def change
    create_table :checkpoints do |t|
      t.string :title

      t.timestamps
    end
  end
end
