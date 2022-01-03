class Person 

        attr_reader :name, :touchpoints

        def initialize(name)
            @name = name 
            @touchpoints = []
        end 

        class TouchPoint

            attr_reader :date_time, :notes 
            
            def initialize(date_time, notes)
                @date_time = date_time 
                @notes = notes 
            end 

        end 

        def add_touch_point(date_time, notes)
            @touchpoints << Person::TouchPoint.new(date_time, notes)
        end 

    end 

   
