class WeighingMachine
  getter precision : Int32
  property weight
  @metric : Bool # T == metric, F = imperial

  def initialize(prec, metric)
    @metric = metric
    @precision = prec
    @weight = 0.0
  end

  def weight(new_weight)
    @weight = new_weight
  end

  def metric=(use_metric : Bool)
    @metric = use_metric
  end

  def weigh : String
    weight = @metric ? @weight : @weight * 2.20462
    weight.round(@precision).to_s
  end
end
