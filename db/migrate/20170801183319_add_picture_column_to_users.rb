class AddPictureColumnToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :small_picture, :string
    add_column :users, :profile_picture, :string
    rename_column :users, :slack, :slack_id
  end
end
