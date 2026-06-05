module Space
  class Age
    ORBITAL_PERIOD_IN_EARTH_YEARS = {
      Mercury: 0.2408467,
      Venus:   0.61519726,
      Earth:   1.0,
      Mars:    1.8808158,
      Jupiter: 11.862615,
      Saturn:  29.447498,
      Uranus:  84.016846,
      Neptune: 164.79132,
    }

    @@age : Float64 = 0

    def self.from_seconds(val)
      @@age = val
      self
    end

    def self.age_on_earth
      (@@age/(365.25*24*60*60)).round(2)
    end

    def self.age_on_mercury
      age_on_earth / ORBITAL_PERIOD_IN_EARTH_YEARS[:Mercury]
    end

    def self.age_on_venus
      age_on_earth / ORBITAL_PERIOD_IN_EARTH_YEARS[:Venus]
    end

    def self.age_on_mars
      age_on_earth / ORBITAL_PERIOD_IN_EARTH_YEARS[:Mars]
    end

    def self.age_on_jupiter
      age_on_earth / ORBITAL_PERIOD_IN_EARTH_YEARS[:Jupiter]
    end

    def self.age_on_saturn
      age_on_earth / ORBITAL_PERIOD_IN_EARTH_YEARS[:Saturn]
    end

    def self.age_on_uranus
      age_on_earth / ORBITAL_PERIOD_IN_EARTH_YEARS[:Uranus]
    end

    def self.age_on_neptune
      age_on_earth / ORBITAL_PERIOD_IN_EARTH_YEARS[:Neptune]
    end
  end
end
