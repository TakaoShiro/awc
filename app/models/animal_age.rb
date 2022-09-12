class AnimalAge < ActiveHash::Base
  #プルダウンでの検索機能にて使用
  self.data = [
    {:id => "0..1", :name => "0~1歳"},
    {:id => "2..2", :name => "2歳"},
    {:id => "3..3", :name => "3歳"},
    {:id => "4..7", :name => "4~7歳"},
    {:id => "8..10", :name => "8~10歳"},
    {:id => "11..25", :name => "11歳以上"},
    {:id => "不明", :name => "不明"},
  ]
end