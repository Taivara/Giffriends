# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :rated_image, :class => 'RatedImages' do
    image nil
    status 1
  end
end
