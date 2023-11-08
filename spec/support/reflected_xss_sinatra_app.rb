# From the sinatra website

require 'sinatra'

get '/' do
  'Hello world!'
end

get '/comment' do
  p = params[:comment]
  "<p>Thanks for this comment:i #{p} </p>"
end
