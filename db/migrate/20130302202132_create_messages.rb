class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.text :text
      t.integer :to
      t.integer :from

      t.timestamps
    end
  end
end
