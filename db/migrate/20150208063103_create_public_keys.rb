class CreatePublicKeys < ActiveRecord::Migration
  def change
    enable_extension 'uuid-ossp'

    create_table :public_keys, id: :uuid do |t|
      t.references :user, index: true
      t.text :key
      t.string :email

      t.timestamps
    end
  end
end
