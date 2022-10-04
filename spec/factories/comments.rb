FactoryBot.define do
  factory :comment do
    text        {'aaaa'}
    association :user
    association :post
  end
end
