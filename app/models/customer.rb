class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  
  scope :regular_customers, -> { where.not(email: 'guest@example.com') }
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  has_one_attached :image
  
  has_many :messages, dependent: :destroy
  has_many :entries, dependent: :destroy
  has_many :animals, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :comments, dependent: :destroy
  
  def get_image(width, height)
    unless image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    image.variant(resize_to_limit: [width, height]).processed
  end
  
  # 検索方法分岐
  def self.looks(search, word)
    if search == "perfect_match"
      @customer = Customer.where("name LIKE?", "#{word}")
    elsif search == "forward_match"
      @customer = Customer.where("name LIKE?","#{word}%")
    elsif search == "backward_match"
      @customer = Customer.where("name LIKE?","%#{word}")
    elsif search == "partial_match"
      @customer = Customer.where("name LIKE?","%#{word}%")
    else
      @customer = Customer.all
    end
  end
end
