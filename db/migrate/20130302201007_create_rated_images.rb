class CreateRatedImages < ActiveRecord::Migration
  def change
    create_table :rated_images do |t|
      t.references :image
      t.integer :status

      t.timestamps
    end
    add_index :rated_images, :image_id
  end
end
