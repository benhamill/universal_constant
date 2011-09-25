require 'universal_constant'
require 'pry'

SPEC_WORKING_DIR = File.join('.', '/work')

def clear_object_cache
  UniversalConstant::GameObject.class_variable_set(:@@ids, [])
end

RSpec.configure do |config|
  config.before(:suite) do
    FileUtils.mkdir(SPEC_WORKING_DIR) unless Dir.exists?(SPEC_WORKING_DIR)
  end

  config.after(:suite) do
    FileUtils.rm_rf(SPEC_WORKING_DIR)
  end
end
