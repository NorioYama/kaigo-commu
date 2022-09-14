FactoryBot.define do
  factory :post_tag_relation do

    association :tag
    association :post
  end
end
