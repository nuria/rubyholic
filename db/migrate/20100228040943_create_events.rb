class CreateEvents < ActiveRecord::Migration
  def self.up
    drop_table :events
    create_table :events do |t|
      t.string :name
      t.string :description
      t.date :start_date
      t.date :end_date
      
      t.integer :location_id,  :null => false, :options => "CONSTRAINT fk_line_item_products REFERENCES locations(id)"
      t.integer :group_id,    :null => false, :options=>"CONSTRAINT fk_line_item_orders REFERENCES group(id)"
   
      t.timestamps
    end
  end

  def self.down
    drop_table :events
  end
end
