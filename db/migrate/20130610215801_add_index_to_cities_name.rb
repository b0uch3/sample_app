class AddIndexToCitiesName < ActiveRecord::Migration
  def change
  	 add_index :cities, :name, unique: true
  end
end
