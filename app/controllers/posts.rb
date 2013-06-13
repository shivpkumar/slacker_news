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

post '/posts/vote' do
  post_id = params.keys[0].to_i
  user = current_user
  PostVote.create(user_id: user.id, post_id: post_id)
  erb :_post_points, { layout: false, locals: { post_id: post_id } }
end

post '/posts/vote2' do
  post_id = params.keys[0].to_i
  user = current_user
  PostVote.create(user_id: user.id, post_id: post_id)
  erb :_post_points2, { layout: false, locals: { post_id: post_id } }
end
