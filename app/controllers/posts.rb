# global nav: profile link, logout link

get '/' do
  @posts = Post.all
  erb :index
end

get '/posts/new' do
  @user = current_user
  erb :create_post
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
