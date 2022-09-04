class CreateAnimals < ActiveRecord::Migration[6.1]
  def change
    create_table :animals do |t|
      t.string :type, null: false
      t.integer :age, null: false
      t.string :gender, null: false
      t.string :prefecture, null: false
      t.text :introduction, null: false
      t.timestamps
    end
  end
end
