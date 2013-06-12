get '/' do
  # show all posts
  erb :index
end

get '/users' do
  # allow users to create new account or login
  erb :login
end

post '/users' do
  # create a new user
end

get '/users/:id' do
  # displays user profile page
  erb :profile
end



