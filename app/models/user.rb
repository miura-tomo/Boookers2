class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         # , :authentication_keys => [:name]
         has_many :books, dependent: :destroy
         has_many :book_comments, dependent: :destroy
         has_many :favorites, dependent: :destroy
         #has_many :profile_images, dependent: :destroy
         attachment :profile_image

         validates :name, presence: true, length: { minimum: 2, maximum: 20 }
         validates :introduction, length: { maximum: 50 }
end