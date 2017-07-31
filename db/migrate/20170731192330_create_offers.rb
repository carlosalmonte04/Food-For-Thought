class CreateOffers < ActiveRecord::Migration[5.1]
  def change
    create_table :offers do |t|
    	t.integer :post_id
    	t.integer :tutor_id
      t.text :comment

      t.timestamps
    end
  end
end
