class CreateImages < ActiveRecord::Migration
  def change
    create_table :images do |t|
      t.integer :imgur_id

      t.timestamps
    end
  end
end
