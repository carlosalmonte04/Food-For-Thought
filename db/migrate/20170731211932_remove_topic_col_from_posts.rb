class RemoveTopicColFromPosts < ActiveRecord::Migration[5.1]
  def change
    remove_column :posts, :topic, :string
  end
end
