class Post < ApplicationRecord
  validates :title, presence: true,length: { maximum: 60 }
  validates :body, presence: true,length: { maximum: 2000 }

  has_many :post_tag_relations, dependent: :destroy
  has_many :tags, through: :post_tag_relations, dependent: :destroy
  belongs_to :user
  has_many :comments, dependent: :destroy
end
