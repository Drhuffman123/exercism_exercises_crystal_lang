module FlattenArray
  def self.flatten(input : Array) : Array
    input.flatten.reject(Nil)
  end
end
