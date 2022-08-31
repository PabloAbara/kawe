class AddNullnessValidation < ActiveRecord::Migration[7.0]
  def change
    change_column_null :checkpoints, :title, false
    change_column_null :resources, :title, false
    change_column_null :resources, :link, false
  end
end
