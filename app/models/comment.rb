class Comment < ApplicationRecord
  validates :text,presence: true,length:{ maximum: 20000}

  belongs_to :user
  belongs_to :post
end
