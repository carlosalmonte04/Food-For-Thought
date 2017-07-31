class CreateRatings < ActiveRecord::Migration[5.1]
  def change
    create_table :ratings do |t|
      t.integer :value
      t.text :comment
      t.integer :reservation_id

      t.timestamps
    end
  end
end
