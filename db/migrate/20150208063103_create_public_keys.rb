class CreatePublicKeys < ActiveRecord::Migration
  def change
    create_table :public_keys do |t|
      t.references :user, index: true
      t.text :key
      t.string :email

      t.timestamps
    end
  end
end
