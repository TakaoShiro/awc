class AnimalType < ActiveHash::Base
  #プルダウンでの検索機能にて使用
  self.data = [
    {:id => "猫", :name => "猫"},
    {:id => "犬", :name => "犬"},
  ]
end