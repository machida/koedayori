class RemovePlayedAtFromPosts < ActiveRecord::Migration[8.1]
  def change
    remove_column :posts, :played_at, :datetime
  end
end
