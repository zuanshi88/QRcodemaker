require 'sinatra'

require "rqrcode"


class QReader < Sinatra::Base

    get '/' do 
        "Hey Sinatra!"
    end 

    get '/:name' do 
        "Hi, #{params[:name]}! How are you?."
    end 




class Code 


    # include 'rqrcode'
  @@codes = 0

  attr_reader :qrcode, :website, :code_as_svg

  def initialize(website = "http://github.com/")
    @@codes += 1
    @qrcode = RQRCode::QRCode.new(website)
    @website = website
  end 

  def codes 
    @@codes
  end 

  def code 
    @code 
  end

  def code_as_svg
        @qrcode.as_svg(
        color: "000",
        shape_rendering: "crispEdges",
        module_size: 11,
        standalone: true,
        use_path: true
        )
    end 

end 

end 