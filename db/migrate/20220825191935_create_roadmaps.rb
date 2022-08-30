# frozen_string_literal: true

class CreateRoadmaps < ActiveRecord::Migration[7.0]
  def change
    create_table :roadmaps do |t|
      t.string :title
      t.string :project_link

      t.timestamps
    end
  end
end
