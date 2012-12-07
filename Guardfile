# A sample Guardfile
# More info at https://github.com/guard/guard#readme

group :test do
  guard :test do
    watch(%r{^lib/(.+)\.rb$})     { |m| "test/#{m[1]}_test.rb" }
    watch(%r{^test/.+_test\.rb$})
    watch('test/test_helper.rb')  { "test" }

    # Rails example
    watch(%r{^app/models/(.+)\.rb$})                   { |m| "test/unit/#{m[1]}_test.rb" }
    watch(%r{^app/controllers/(.+)\.rb$})              { |m| "test/functional/#{m[1]}_test.rb" }
    watch(%r{^app/views/.+\.rb$})                      { "test/integration" }
    watch('app/controllers/application_controller.rb') { ["test/functional", "test/integration"] }
  end
end

group :jasmine do
  guard :jasmine do
    watch(%r{spec/javascripts/spec\.(js\.coffee|js|coffee)$}) { 'spec/javascripts' }
    watch(%r{spec/javascripts/.+_spec\.(js\.coffee|js|coffee)$})
    watch(%r{app/assets/javascripts/(.+?)/(.+?)\.js$}) { |m| "spec/javascripts/#{ m[1] }/#{ m[2] }_spec.js.coffee" }
  end
end