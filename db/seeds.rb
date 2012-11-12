require 'factory_girl_rails'

# Create three users for testing
FactoryGirl.create_list(:user, 3)

# Create and admin user
FactoryGirl.create(:admin)
