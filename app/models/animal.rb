class Animal < ApplicationRecord
  
  has_one_attached :image
  
  belongs_to :customer
  has_many :favorites, dependent: :destroy
  has_many :comments, dependent: :destroy
  
  validates :animal_type, presence: true
  validates :gender, presence: true
  validates :age, presence: true
  validates :prefecture, presence: true
  validates :introduction, presence: true
  
  def get_image(width, height)
    unless image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    image.variant(resize_to_limit: [width, height]).processed
  end
  
  #ユーザーがその投稿に対していいねをしているか判断
  def favorited_by?(customer)
    favorites.exists?(customer_id: customer.id)
  end
end
