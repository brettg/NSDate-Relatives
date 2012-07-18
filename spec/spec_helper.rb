SRC_ROOT = File.expand_path('../..', __FILE__)

require 'rspec'

framework_path = File.expand_path('build/Release/nsdate-relatives-for-specs.framework',
                                  SRC_ROOT)
framework framework_path

RSpec.configure do |config|
end
