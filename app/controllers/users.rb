get '/users/new' do
  erb :login
end

post '/users' do
  user = User.find_by_username(params[:user][:username])
  
  if user != nil
    user = User.authenticate(params[:user])
  else
    user = User.create(params[:user])
  end

  if user.valid?
    create_session(user)
    redirect "/users/#{user.id}"
  end
  
  redirect '/'
end

get '/users/logout' do
  session.clear
  redirect '/'
end

get '/users/:id' do
  @user = User.find(params[:id])
  erb :profile
end
