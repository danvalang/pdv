class RemoveCurtFromTiendas < ActiveRecord::Migration
  def up
    change_table :tiendas do |t|
      t.remove :curt
      t.integer :curt
    end

    def down
      change_table :tiendas do |t|
        t.remove :curt
        t.string :curt
      end
    end
  end
end
