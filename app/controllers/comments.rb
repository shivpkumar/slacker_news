get '/comments' do
  @comments = Comment.all
  erb :comments
end

post '/comments' do
  comment = Comment.create(comment: params[:comment])
  post = Post.find(params[:post_id])
  post.comments << comment
  redirect "/posts/#{post.id}"
end
