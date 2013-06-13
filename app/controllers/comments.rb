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

post '/comments/vote' do
  comment_id = params.keys[0].to_i
  user = current_user
  CommentVote.create(user_id: user.id, comment_id: comment_id)
  erb :_comment_points, { layout: false, locals: { comment_id: comment_id } }
end
