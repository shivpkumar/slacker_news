get '/' do
  @posts = Post.all
  erb :home
end

get '/posts/new' do
  if logged_in?
    @user = current_user
    erb :create_post
  else
    redirect '/users/new'
  end
end

get '/posts/:id' do
  @post = Post.find(params[:id])
  erb :show_post
end

post '/posts' do
  post = Post.create(params[:post])
  user = User.find(params[:user_id])
  user.posts << post
  redirect "/posts/#{post.id}"
end
