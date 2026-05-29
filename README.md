# exercism_exercises_crystal_lang
https://github.com/Drhuffman123/exercism_exercises_crystal_lang

Example code for https://exercism.org in Crystal-Lang

Version: 0.1.44

[![Crystal CI](https://github.com/Drhuffman123/exercism_exercises_crystal_lang/actions/workflows/crystal.yml/badge.svg)](https://github.com/Drhuffman123/exercism_exercises_crystal_lang/actions/workflows/crystal.yml)

Issues!:
  * https://exercism.org IS LYING to me and won't let me complete the example!

    WHY does "exorcism.oerCalculator must be (Float64 | Int32), not Nil"
    eventhough I have it coded as "def initialize(total_food : Int32 | Float64, ..."?

    My "FodderCalculator" class looks like this:
    `
    # ...
    class FodderCalculator
      property total_food : Int32 | Float64
      property animals : Irg" state "Error: instance variable '@total_food' of Foddnt32 | Float64

      def initialize(total_food : Int32 | Float64 | Nil, animals : Int32 | Float64 | Nil)
        @total_food = 0
        @animals = 0

        if !total_food.nil?
          @total_food = total_food
        end

        if !animals.nil?
          @animals = animals
        end
    end
    # ...
    `

    In the "FodderCalculator" class, I have "property total_food : Int32 | Float64", NOT "property total_food : Int32 | Float64 | Nil".

    In the "initialize()" method of the "FodderCalculator" class, I have params decalred such as "total_food : Int32 | Float64", NOT as "@total_food : Int32 | Float64 | Nil"!

    My method has NO "@" before "total_food" and NO "Nil" as an option !)

  * Specs to be added for code completed online (before I switched to coding locally with specs)
    - But, I grabbed my code from the exercism.org site and should back-fill the specs from the exercism.org site.
    - But, for now, this will suffice since the site ran it's checks and said my sode is passing. :)

  * TODO: continue "Secrets" (and apply a real solution instead of the Hackis solution I went with in branch "2026-05-14b,-Secrets")

  * Be sure to do `bin/ameba --fix` and `crystal tool format`
