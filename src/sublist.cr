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

  def self.check_sublist?(list1 : Array(Int32), list2 : Array(Int32))
    is_sublist = true
    elem_prev = Nil
    list1.map{|elem| is_sublist = is_sublist && list2.includes?(elem) && elem_prev != elem}
    if is_sublist
      Classification::Sublist
    else
      Classification::Unequal
    end
  end

  def self.check_superlist?(list1 : Array(Int32), list2 : Array(Int32))
    is_sublist = true
    list2.map{|elem| is_sublist = is_sublist && list1.includes?(elem)}
    if is_sublist
      Classification::Superlist
    else
      Classification::Unequal
    end
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
      check_sublist?(list1,list2) || check_mis_match_sub_group?(list1,list2,0,list1.size-1,Classification::Sublist)
    elsif list1.size > list2.size
      check_superlist?(list1,list2) || check_mis_match_sub_group?(list1,list2,0,list2.size-1,Classification::Superlist) 
    # elsif list1.size != list2.size
      # check_unequal?(list1,list2) 
      # Classification::Unequal
    else
      Classification::Unequal
    end
  end
end
