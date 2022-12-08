class CreateStores < ActiveRecord::Migration[6.1]
  def change
    create_table :stores do |t|
      t.string :store_name
      t.string  :location 
      t.string   :description 

      t.timestamps
    end
  end
end
