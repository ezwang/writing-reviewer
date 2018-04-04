class AddTitleToAssignment < ActiveRecord::Migration[5.1]
  def change
    add_column :assignments, :title, :string
  end
end
