class CreateRoles < ActiveRecord::Migration
  def change
    create_table :roles do |t|
      t.references :user
      t.string :type

      t.timestamps
    end
  end
end
