class AddCustomerIdToAnimals < ActiveRecord::Migration[6.1]
  #animalにcustomer.idが必要だった為、カラム追加
  def change
    add_reference :animals, :customer, foreign_key: true
  end
end
