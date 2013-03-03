# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :message do
    text "Ponies and butterflies"
    to nil
    from nil
  end
end
