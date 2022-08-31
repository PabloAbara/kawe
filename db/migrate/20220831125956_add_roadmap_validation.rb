class AddRoadmapValidation < ActiveRecord::Migration[7.0]
  def change
    change_column_null :roadmaps, :title, false
    change_column_null :roadmaps, :project_link, false
  end
end
