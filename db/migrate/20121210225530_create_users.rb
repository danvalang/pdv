class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :nombre
      t.string :contrasena
      t.string :email

      t.timestamps
    end
  end
end
