# == GET =========================

get '/post/create' do
  erb :create_post
end

get '/post/recent' do
  @posts = Post.order("created_at DESC").limit(4)
  erb :many_posts
end

get '/post/:id' do
  @post = Post.find(params[:id])
  erb :_view_post
end

get '/tag/view' do
  @tag = Tag.find(params[:id])
  @posts = @tag.posts
  erb :many_posts
end



# == POST ==========================

post '/post/create' do
  p = Post.new(params[:post])
  p.tags = prepare_tags(params[:tags])
  if p.save
    redirect to "/post/#{p.id}"
  else
    #failure page
  end
end
