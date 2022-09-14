FactoryBot.define do
  factory :post do
    title  {'こんにちわ'}
    body   {'私は介護をして7年目です。よろしくお願いします'}
    association :user
  end
end
