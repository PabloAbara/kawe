# frozen_string_literal: true

class AddRoadmapToCheckpoints < ActiveRecord::Migration[7.0]
  def change
    add_reference :checkpoints, :roadmap, null: false, foreign_key: true
  end
end
