class User < ApplicationRecord

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :sex
  belongs_to :age
  has_many   :posts, dependent: :destroy
  has_many   :comments

  validates :nickname, presence: true
  validates :sex_id, numericality: { other_than: 1 , message: "を入力してください"}
  validates :age_id, numericality: { other_than: 1 , message: "を入力してください"}
  validates :password,
            format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i, message: 'は半角英数字の両方を含めてください' }


            
end
