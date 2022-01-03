
require_relative "../client/Person.rb"

RSpec.describe "initialized properly" do 

    subject { Person.new("John")}

    it "has a name" do 
        expect(subject.name).to eq("John")
    end 

    it "has an empty array for touch points" do 
        expect(subject.touchpoints).to eq([])
    end 

    it "can add touch points" do 
        subject.add_touch_point(Time.now, "Test note")
        expect(subject.touchpoints.length).to eq(1)
        expect(subject.touchpoints[0].notes).to eq("Test note")
        expect(subject.touchpoints[0].date_time.class).to eq(Time)
        expect(subject.touchpoints[0].date_time.strftime("%H:%M" )).to match(/\d\d:\d\d/)
    end 
    
end 