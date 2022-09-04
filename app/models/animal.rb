class Animal < ApplicationRecord
  
  has_many :favorites, dependent: :destroy
  has_many :comments, dependent: :destroy
  
end
