FactoryBot.define do
  factory :user do
    nickname              {'test'}
    sex_id                {'2'}
    age_id                {'2'}
    email                 {'test@example'}
    password              {'0000abcc'}  
    password_confirmation {password}
  end
end