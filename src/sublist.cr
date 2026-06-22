module Sublist
  enum Classification
    Equal
    Unequal
    Sublist
    Superlist
    TODO
    ERROR
  end

  def self.classify(list1 : Array(Int32), list2 : Array(Int32)) : Classification
    if list1.size == list2.size
      if list1 == list2
        Classification::Equal
      else
        Classification::Unequal
      end
    elsif list1.size < list2.size
      is_sublist = true
      list1.map{|elem| is_sublist = is_sublist && list2.includes?(elem)}
      if is_sublist
        Classification::Sublist
      else
        Classification::ERROR
      end
    elsif list1.size > list2.size
      is_sublist = true
      list2.map{|elem| is_sublist = is_sublist && list1.includes?(elem)}
      if is_sublist
        Classification::Superlist
      else
        Classification::ERROR
      end
    else
      Classification::TODO
    end
  end
end
