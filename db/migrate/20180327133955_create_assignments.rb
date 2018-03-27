class CreateAssignments < ActiveRecord::Migration[5.1]
  def change
    create_table :assignments do |t|
      t.references :creator, references: :users, foreign_key: true
      t.datetime :due_date
      t.datetime :review_date

      t.timestamps
    end
  end
end
