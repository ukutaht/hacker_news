get '/' do
  @all_posts = Post.all.reverse
  erb :index
end

get '/posts/:id' do
  @post = Post.find(params[:id])
  @comments = @post.comments.reverse
  erb :post
end

post '/posts/:id/comments' do

  comment = Comment.new(params[:comment])
  post = Post.find(params[:id])
  
  if comment.valid? && authenticated?
    post.comments << comment
    current_user.comments << comment
    comment.save
    redirect "/posts/#{params[:id]}"
  elsif comment.valid?
    redirect '/login'
  else
    redirect "/posts/#{params[:id]}"
  end
end

get '/new_post' do
  erb :new_post
end

post '/new_post' do
  post = Post.new(params[:post])
  
  if authenticated? && post.valid?
    post.save
    redirect '/'
  elsif post.valid?
    redirect '/login'
  else
    redirect 'new_post'
  end

end
