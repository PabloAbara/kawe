# frozen_string_literal: true

class CreateResources < ActiveRecord::Migration[7.0]
  def change
    create_table :resources do |t|
      t.string :title
      t.string :link
      t.references :checkpoint, null: false, foreign_key: true

      t.timestamps
    end
  end
end
