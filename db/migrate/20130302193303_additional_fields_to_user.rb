class AdditionalFieldsToUser < ActiveRecord::Migration

def up
  change_table :users do |t|
    t.integer :age
    t.date :birthday
  end
end

def down
  remove_column :users, :age
  remove_column :users, :birthday
end
end
