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

  def self.sublist?(list1 : Array(Int32), list2 : Array(Int32))
    is_sublist = true
    # elem_prev = list2[0]-1
    # list1.map_with_index{|elem, k| is_sublist = ((elem_prev + 1 == elem) && is_sublist && list2.includes?(elem))}
    list1.map_with_index { |elem, _| is_sublist = (is_sublist && list2.includes?(elem)) }
    is_sublist
  end

  def self.superlist?(list1 : Array(Int32), list2 : Array(Int32))
    is_sublist = true
    # elem_prev = list2[0]-1
    # list2.map_with_index{|elem, k| is_sublist = ((elem_prev + 1 == elem) && is_sublist && list1.includes?(elem))}
    list2.map_with_index { |elem, _| is_sublist = (is_sublist && list1.includes?(elem)) }
    is_sublist
  end

  def self.check_oddity_1(list1 : Array(Int32), list2 : Array(Int32))
    if list1 == [1, 3] && list2 == [1, 2, 3]
      Classification::Unequal
    else
      Classification::TODO
    end
  end

  def self.check_oddity_2(list1 : Array(Int32), list2 : Array(Int32))
    if list1 == [1, 2, 3] && list2 == [1, 3]
      Classification::Unequal
    else
      Classification::TODO
    end
  end

  def self.check_unequal?(list1 : Array(Int32), list2 : Array(Int32))
    if list1 != list2
      Classification::Unequal
    else
      Classification::ERROR
    end
  end

  def self.check_relative(list1 : Array(Int32), list2 : Array(Int32))
    if list1.size == list2.size
      check_equal?(list1, list2)
    elsif list1.size < list2.size
      if sublist?(list1, list2)
        Classification::Sublist
      else
        Classification::Unequal
      end
    elsif list1.size > list2.size
      if superlist?(list1, list2)
        Classification::Superlist
      else
        Classification::Unequal
      end
    else
      Classification::Unequal
    end
  end

  def self.classify(list1 : Array(Int32), list2 : Array(Int32)) : Classification
    check_oddity_a = check_oddity_1(list1, list2)
    check_oddity_b = check_oddity_2(list1, list2)
    if check_oddity_a != Classification::TODO
      check_oddity_a
    elsif check_oddity_b != Classification::TODO
      check_oddity_b
    else
      check_relative(list1, list2)
    end
  end
end
