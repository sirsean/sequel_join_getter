module Sequel
    module Plugins
        module JoinGetter
            VERSION = "0.1"

            module InstanceMethods
                def method_missing(*args)
                    if args.size == 1
                        key = args[0]
                        if self.values.has_key?(key)
                            self.values[key]
                        else
                            raise NoMethodError, "undefined method `#{key.to_s}' for #{self.to_s}"
                        end
                    elsif args.size > 1
                        raise NoMethodError, "undefined method `#{args[0].to_s}' for #{self.to_s}"
                    else
                        raise NoMethodError, "undefined method for #{self.to_s}"
                    end
                end
            end
        end
    end
end
