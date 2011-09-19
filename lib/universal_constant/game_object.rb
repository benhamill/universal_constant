class UniversalConstant::GameObject
  attr_reader :id

  @@ids = []

  def self.find(id)
    @@ids[id.to_i]
  end

  def initialize(attrs = {})
    @id = UniversalConstant::GameObject.assign_id(self)

    attrs.symbolize_keys!
    attrs.delete(:id)
    attrs.each do |key, value|
      instance_variable_set(:"@#{key.to_sym}", value)
    end
  end

  private

  def self.assign_id(obj)
    id = @@ids.length
    @@ids[id] = obj
    id
  end
end
