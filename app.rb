require 'sinatra'
require "rqrcode"
require_relative "model/Code.rb"


class QReader < Sinatra::Base

    get '/' do 
        erb :index 
    end 

    post '/my-post-route' do 
        data = JSON.parse(request.body.read, symbolize_names: true)
        puts "POST with #{ data.to_json } to /my-post-route"

        data.to_json
    end 

    post '/qr/new' do 

        qrcode = RQRCode::QRCode.new(params[:address])

        # NOTE: showing with default options specified explicitly
        @svg = qrcode.as_svg(
        color: "000",
        shape_rendering: "crispEdges",
        module_size: 5,
        standalone: true,
        use_path: true
        )

        erb :qrcode
    end 

    # get '/public-keys' do 
    #     content_type "application/json"
    #     {key: ENV['STRIPE_PUBLIC_KEY'].to_json}
    # end 

    # get '/:name' do 
    #     "Hi, #{params[:name]}! How are you?."
    # end 

    get '/ruby' do     

                code = '<%john = Person.new("John")%>
                <% john.add_touch_point(Time.now, "Went to the zoo")%>
                <% john.add_touch_point(Time.now, "Played Parcheesie")%>
                <% john.add_touch_point(Time.now, "Ate at Rios")%>
                <h1><%= "#{john.name}"  %></h1>
                <ul>
                <% john.touchpoints.each do |point| %>
                    <li> <%= point.date_time.strftime("%H:%M") + " : " + point.notes %></li>
                <% end %>
                </ul>'

       erb code
    end 

end 