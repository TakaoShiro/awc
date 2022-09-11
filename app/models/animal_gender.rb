class AnimalGender < ActiveHash::Base
  #プルダウンでの検索機能にて使用
  self.data = [
    {:id => "♂", :name => "♂"},
    {:id => "♀", :name => "♀"},
  ]
end