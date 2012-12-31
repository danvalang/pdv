class ChangeCurtFromTiendas < ActiveRecord::Migration
  def change
  	change_table :tiendas do |t|
  		t.remove :curt
  		t.integer :curt
  	end
  end
end
