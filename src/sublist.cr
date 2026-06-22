module Sublist
  enum Classification
    Equal
    Unequal
    Sublist
    Superlist
    SUBGROUP
    ERROR
    TODO
  end

  def self.check_equal?(list1 : Array(Int32), list2 : Array(Int32))
    if list1 == list2
      Classification::Equal
    else
      Classification::Unequal
    end
  end

  def self.is_sublist?(list1 : Array(Int32), list2 : Array(Int32))
    is_sublist = true 
    # elem_prev = list2[0]-1
    # list1.map_with_index{|elem, k| is_sublist = ((elem_prev + 1 == elem) && is_sublist && list2.includes?(elem))}
    list1.map_with_index{|elem, k| is_sublist = (is_sublist && list2.includes?(elem))}
    is_sublist
  end

  def self.is_superlist?(list1 : Array(Int32), list2 : Array(Int32))
    is_sublist = true
    # elem_prev = list2[0]-1
    # list2.map_with_index{|elem, k| is_sublist = ((elem_prev + 1 == elem) && is_sublist && list1.includes?(elem))}
    list2.map_with_index{|elem, k| is_sublist = (is_sublist && list1.includes?(elem))}
    is_sublist    
  end

  def self.check_mis_match_sub_group?(list1 : Array(Int32), list2 : Array(Int32), from = 0, to = -1, match_type = Classification::ERROR)
    if list1[from..to] == list2[from..to]
      match_type
    else
      Classification::Unequal
    end
  end

  def self.check_unequal?(list1 : Array(Int32), list2 : Array(Int32))
    if list1 != list2
      Classification::Unequal
    else
      Classification::ERROR
    end
  end

  def self.classify(list1 : Array(Int32), list2 : Array(Int32)) : Classification
    if list1.size == list2.size
      check_equal?(list1, list2)
    elsif list1.size < list2.size
      if is_sublist?(list1,list2)
        Classification::Sublist
      else
        Classification::Unequal
      end
    elsif list1.size > list2.size
      if is_superlist?(list1,list2)
        Classification::Superlist
      else
        Classification::Unequal
      end
    else
      Classification::Unequal
    end
  end
end
