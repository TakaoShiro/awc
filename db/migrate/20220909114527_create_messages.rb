class CreateMessages < ActiveRecord::Migration[6.1]
  def change
    create_table :messages do |t|
      t.references :customer
      t.references :room
      t.text :direct_message
      t.timestamps
    end
  end
end
