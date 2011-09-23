class UniversalConstant::Room < UniversalConstant::GameObject
  attr_accessor :description, :name, :exits

  def initialize(args = {})
    @exits = {}
    args.symbolize_keys!.delete(:exits)
    super(args)
  end

  def add_exit(name, target)
  end

  def exit?(name)
  end

  def exit(name)
  end

  def dig(from_here, target, from_target)
  end
end
