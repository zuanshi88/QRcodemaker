require_relative "../app.rb"
require "rqrcode"

describe "can create new QR code" do 

    subject {Code.new}
    
    it 'can increase by one' do 
        expect(subject.codes).to eq (1)
    end 

    it 'has website' do 
        expect(subject.website).to eq("http://github.com/")
    end 

    # it 'has svg display' do
    #     expect(subject.code_as_svg).to eq(true)
    # end 

end 