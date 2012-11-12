FactoryGirl.define do

  factory :authentication do
    provider 'Facebook'
    uid '00000000'
    user
  end

end