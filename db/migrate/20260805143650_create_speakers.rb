class CreateSpeakers < ActiveRecord::Migration[8.1]
  def change
    create_table :speakers do |t|
      t.references :family, null: false, foreign_key: true
      t.string :name
      t.string :slug
      t.time :notify_at, null: false, default: "15:00"
      t.string :notification_email
      t.boolean :notifications_enabled, default: true
      t.boolean :active, default: true

      t.timestamps
    end
    add_index :speakers, :slug, unique: true
  end
end
