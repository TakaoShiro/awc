class CreateAnimals < ActiveRecord::Migration[6.1]
  def change
    create_table :animals do |t|
      t.string :animal_type, null: false
      t.string :age, null: false
      t.string :gender, null: false
      t.string :prefecture, null: false
      t.text :introduction, null: false
      t.timestamps
    end
  end
end
