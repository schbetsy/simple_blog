# == GET =========================

get '/post/create' do
  @user_id = session[:user_id] 
  if @user_id == nil 
    redirect to '/?needlogin=true'
  else
    erb :create_post
  end
end

get '/post/edit' do
  @user_id = session[:user_id]
  if @user_id == nil 
    redirect to '/?needlogin=true'
  else
    @post = Post.find(params[:id])
    erb :edit_post
  end
end

get '/post/recent' do
  @user_id = session[:user_id] 
  @posts = Post.order("created_at DESC").limit(4)
  @title = "Recent posts from our users"
  erb :many_posts
end

get '/post/:id' do
  @user_id = session[:user_id] 
  @post = Post.find(params[:id])
  erb :_view_post
end

get '/tag/view' do
  @user_id = session[:user_id] 
  @tag = Tag.find(params[:id])
  @posts = @tag.posts
  @title = "Recent posts tagged with \##{@tag.name}"
  erb :many_posts
end

get '/user/view' do
  @user_id = session[:user_id] 
  @user_to_view = User.find(params[:id])
  @posts = @user_to_view.posts
  @title = "#{@user_to_view.name}'s Recent posts"
  erb :many_posts
end





# == POST ==========================

post '/post/create' do
  p = Post.new(params[:post])
  p.tags = prepare_tags(params[:tags])
  p.user_id = session[:user_id] 
  if p.save
    redirect to "/post/#{p.id}"
  else
    #failure page
  end
end

post '/post/update/:id' do
  #edit this stuff
  p = Post.find(params[:id])
  p.tags = prepare_tags(params[:tags])
  p.update_attributes(params[:post])
  p.user_id = session[:user_id] 
  if p.save
    redirect to "/post/#{p.id}"
  else
    #failure page
  end
end
