class AddThemeToPosts < ActiveRecord::Migration[8.1]
  def change
    add_reference :posts, :theme, null: true, foreign_key: true
  end
end
