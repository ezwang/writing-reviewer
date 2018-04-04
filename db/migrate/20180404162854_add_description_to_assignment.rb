class AddDescriptionToAssignment < ActiveRecord::Migration[5.1]
  def change
    add_column :assignments, :description, :text
  end
end
