require 'sinatra/base'
require 'sinatra/reloader'

class Application < Sinatra::Base
  # This allows the app code to refresh
  # without having to restart the server.
  configure :development do
    register Sinatra::Reloader
  end

  #1 When we run GET http://localhost:9292 in Postman,
  # it returns 'Hello!' with Status 200 OK
  get '/' do
    return 'Hello!'
  end

  #2 When we run GET http://localhost:9292/posts in Postman,
  # it returns 'A list of posts' with Status 200 OK
  get '/posts' do
    return 'A list of posts'
  end

  #3 Post request
  # When we run POST http://localhost:9292/posts in Postman,
  # it returns 'Post was created' with Status 200 OK
  post '/posts' do
    return 'Post was created'
  end

  #4 Adding query parameters
  # When we run POST with parameters, the values will be logged in the terminal
  # FOr example set http://localhost:9292/posts_1?name=Leo&cohort_name=April

  get '/posts_1' do
    name = params[:name]
    cohort_name = params[:cohort_name]
    return "Hello #{name}, your cohort is #{cohort_name}"
  end

  #02 Exercise
  get '/hello' do
    name = params[:name]
    return "Hello #{name}"
  end

  #02 Challenge
  post '/submit' do
    name = params[:name]
    message = params[:message]

    return "Thanks #{name} you have sent message: #{message}"
  end
end

#Routing table - contains all routes (made in Application class)

#GET / -> Execute some code
#
# GET /todos/1 -> Execute different code
#
# POST /todos -> Executes different code