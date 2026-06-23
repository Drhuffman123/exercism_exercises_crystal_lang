class EliudsEggs
  def self.egg_count(number : Int32) # : Int32
    arr_eggs = [] of Int32
    number.to_s(2).chars.map_with_index do |x,i|
      egg_qty = x.to_i*(2**i)
      if egg_qty > 0
        arr_eggs << egg_qty
      end
    end
    arr_eggs.size
  end
end
