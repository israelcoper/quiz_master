class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.boolean :admin,           null: false, default: false
      t.string :email,            null: false, default: ""
      t.string :password_digest
      t.string :first_name
      t.string :last_name

      t.timestamps
    end
    add_index :users, :email,     unique: true
  end
end
