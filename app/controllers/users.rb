get '/users/new' do
  erb :login
end

post '/users' do
  user = User.find_or_create_by_username(params[:user])
  if user.valid?
    create_session(user)
    redirect "/users/#{user.id}"
  else
    redirect '/'
  end
end

get '/users/:id' do
  @user = User.find(params[:id])
  erb :profile
end
