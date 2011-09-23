require 'universal_constant'
require 'pry'

RSpec.configure do |config|
  # Nothin' so far.
end

def clear_object_cache
  UniversalConstant::GameObject.class_variable_set(:@@ids, [])
end
