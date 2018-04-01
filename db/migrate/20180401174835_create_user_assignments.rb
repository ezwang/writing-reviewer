class CreateUserAssignments < ActiveRecord::Migration[5.1]
  def change
    create_table :user_assignments do |t|
      t.references :user, foreign_key: true
      t.references :assignment, foreign_key: true
      t.integer :group

      t.timestamps
    end
  end
end
