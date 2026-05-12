module ColossalCoaster
  def self.add_to_queue(express_queue, normal_queue, express, person_name)
    if express == 1
      express_queue << person_name
    else
      normal_queue << person_name
    end
  end

  def self.find_my_friend(queue, friend_name)
    queue.index(friend_name) || -1
  end

  def self.add_with_friends(queue, friend_name, person_name)
    friend_index = find_my_friend(queue, friend_name)
    if friend_index == 0
      [person_name] + queue
    else
      queue[0..friend_index - 1] + [person_name] + queue[friend_index...]
    end
  end

  def self.remove_from_queue(queue, person_name)
    queue.delete(person_name)
    queue
  end

  def self.sorted_queue(queue)
    queue.sort
  end
end
