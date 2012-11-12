FactoryGirl.define do

  sequence :email do |n|
    "test.#{n}@taivara.com"
  end

  factory :user do
    email
    password 'testing'
    password_confirmation 'testing'

    factory :admin do
      email 'admin@trails.com'

      after(:create) do |instance|
        create_list(:role, 1, user: instance)
      end
    end
  end

end