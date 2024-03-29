module UniversalConstant
  class Room < GameObject
    attr_accessor :description, :name, :exits

    def initialize(args = {})
      @exits = {}
      args.symbolize_keys!.delete(:exits)
      super(args)
    end

    def add_exit(name, target, opts = {})
      opts.symbolize_keys!
      @exits[name.to_s.downcase] = target
      target.add_exit(opts[:back], self) if opts[:back]
    end

    def exit?(name)
      @exits.has_key?(name.to_s.downcase)
    end

    def exit(name)
      @exits[name.to_s.downcase]
    end

    def dig(from_here, target_name, opts = {})
      target = Room.new(:name => target_name)
      self.add_exit(from_here, target, opts)

      target
    end

    def serialize
      RoomSerializer.new(self).serialize
    end
  end
end
