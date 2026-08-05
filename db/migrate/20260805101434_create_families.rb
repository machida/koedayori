class CreateFamilies < ActiveRecord::Migration[8.1]
  def change
    create_table :families do |t|
      t.string :email
      t.string :aikotoba
      t.string :password_digest

      t.timestamps
    end
    add_index :families, :email, unique: true
    add_index :families, :aikotoba, unique: true
  end
end
