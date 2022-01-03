require 'dotenv'
require 'sinatra'
require_relative '../client/Person.rb'
# require 'stripe'

Dotenv.load

# in development you would use test_key
# #Stripe.api_key = ENV['STRIPE_SECRET_KEY']

# puts  Stripe::Plans.list

set :static, true 
# set :public_folder, "client"
# set :public_folder, File.join(File.dirname(__FILE__), ENV["STATIC_DIR"])
set :port, 4242 

get '/' do 
# content_type "text/html"
# "<h1 style='color: blue;'>Yes, this is the index</h1>"
    # send_file File.join(settings.public_folder, 'index.html')
erb :index
    # send_file File.join(settings.public_folder, index.html)

end 

get '/hello/:name' do 

    "Hello #{params['name'].upcase}!"

end 

get '/time' do 
    code = "<%= Time.now %>"
    erb code 
end 

# get '/public-keys' do 
#     content_type "application/json"
#     {key: ENV['STRIPE_PUBLIC_KEY']}.to_json
# end 

post '/my-post-route' do 
    data = JSON.parse(request.body.read, symbolize_names: true)
    puts "POST with #{ data.to_json } to /my-post-route"

    data.to_json
end 


get '/poem' do 
     code = "<%= Time.now %>"
    erb code 

    "
    <h1> THIS IS MY POEM </h1>
    <ul>
        <li>This is my poem.</li> 
        <li>This is my Song.</li>
        <li>When we win we are right.</li>
        <li>When we lose we are wrong.</li>
    </ul>"
end 

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



