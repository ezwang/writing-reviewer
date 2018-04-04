class CreateAssignments < ActiveRecord::Migration[5.1]
  def change
    create_table :assignments do |t|
      t.references :creator
      t.datetime :due_date
      t.datetime :review_date

      t.timestamps
    end
  end
end
