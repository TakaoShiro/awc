class CreateEntries < ActiveRecord::Migration[6.1]
  def change
    create_table :entries do |t|
      t.references :customer
      t.references :room
      t.timestamps
    end
  end
end
