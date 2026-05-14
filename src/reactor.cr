class Reactor
  def self.criticality_balanced?(temperature, neutrons_emitted)
    temperature < 800 && neutrons_emitted > 500 && (temperature * neutrons_emitted < 500000)
  end

  def self.reactor_efficiency(voltage, current, theoretical_max_power)
    gp = voltage*current

    ef = gp/theoretical_max_power

    if ef >= 0.8
      "green"
    elsif ef > 0.6
      "orange"
    elsif ef > 0.3
      "red"
    else
      "black"
    end
  end

  def self.fail_safe(temperature, neutrons_produced_per_second, threshold)
    score = temperature * neutrons_produced_per_second

    if score < 0.9 * threshold
      "LOW"
    elsif (0.9*threshold) <= score && score <= (1.1*threshold)
      "NORMAL"
    else
      "DANGER"
    end
  end
end
