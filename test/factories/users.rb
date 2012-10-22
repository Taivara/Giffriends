FactoryGirl.define do

  sequence :email do |n|
    "test.#{n}@taivara.com"
  end

  factory :user do
    email
    password 'testing'
    password_confirmation 'testing'
  end
end