require 'dotenv'
require 'sinatra'
# require 'stripe'

Dotenv.load

# in development you would use test_key
# #Stripe.api_key = ENV['STRIPE_SECRET_KEY']

# puts  Stripe::Plans.list

get '/' do 
    'Hello Mother Fuckers!!!!!'
end 

