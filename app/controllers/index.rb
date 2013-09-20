# == GET =========================

get '/' do
  @user_id = session[:user_id] 
  @sign_in = true if params[:signin]
  @sign_up = true if params[:signup]
  @error = true if params[:err]
  @need_login = true if params[:needlogin]
  erb :index
end

# == POST ==================

post '/logout' do
  session.clear
  redirect to '/'
end

post '/login' do
  user = User.validate(params[:user])
  if user
    session[:user_id] = user.id
    redirect to "/user/home"
  else
    redirect to '/?signin=true&err=true'
  end
end

post '/signup' do
  user = User.new(params[:user])
  if user.save
    session[:user_id] = user.id
    redirect to '/user/home'
  else
    redirect to '/?signup=true&err=true'
  end
end
