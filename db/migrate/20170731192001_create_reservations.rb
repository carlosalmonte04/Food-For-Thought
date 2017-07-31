class CreateReservations < ActiveRecord::Migration[5.1]
  def change
    create_table :reservations do |t|
      t.datetime :time
      t.string :status
      t.integer :post_id
      t.integer :student_id
      t.integer :tutor_id

      t.timestamps
    end
  end
end
