ENV['RAILS_ENV'] = 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'
require 'factory_girl_rails'

class ActiveSupport::TestCase
  include FactoryGirl::Syntax::Methods
end

class ActionController::TestCase
  include Devise::TestHelpers

  def setup
    @request.env['devise.mapping'] = Devise.mappings[:user]
  end
end
