class ChangeDefaultValInPosts < ActiveRecord::Migration[5.1]
  def change
  	change_column :posts, :status, :string, default: "open"
  end
end
