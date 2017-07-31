class CreatePosts < ActiveRecord::Migration[5.1]
  def change
    create_table :posts do |t|
      t.string :status
      t.string :topic
      t.string :compensation
      t.string :length
      t.datetime :deadline
      t.text :description
      t.integer :student_id

      t.timestamps
    end
  end
end
