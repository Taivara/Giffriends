class AdditionalFieldsToUser < ActiveRecord::Migration

  change_table :users do |t|
    t.integer :age
    t.date :birthday
  end

end
