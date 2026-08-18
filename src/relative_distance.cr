class RelativeDistance
  property fam_tree : Hash(String, Array(String))

  def initialize(fam_tree : Hash(String, Array(String)))
    @fam_tree = fam_tree
  end

  def degree_of_separation(from_name, to_name) : Int32
    if @fam_tree[from_name].includes?(to_name)
      1
    elsif @fam_tree[0].includes?(from_name) && @fam_tree[0].includes?(to_name)
      1
    else
      -1
    end
  end
end