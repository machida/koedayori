class CreatePosts < ActiveRecord::Migration[8.1]
  def change
    create_table :posts do |t|
      t.references :speaker, null: false, foreign_key: true
      t.datetime :played_at

      t.timestamps
    end
  end
end
