class CreateEssays < ActiveRecord::Migration[5.1]
  def change
    create_table :essays do |t|
      t.references :user_assignment, foreign_key: true

      t.timestamps
    end
  end
end
