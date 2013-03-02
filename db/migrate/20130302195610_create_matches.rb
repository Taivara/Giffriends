class CreateMatches < ActiveRecord::Migration
  def change
    create_table :matches do |t|
      t.references :user
      t.integer :match_id
      t.boolean :interested

      t.timestamps
    end

    add_index :matches, :match_id
    add_index :matches, :user_id

  end
end
