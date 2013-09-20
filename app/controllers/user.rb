# == GET =========================

get '/user/home' do
  @user_id = session[:user_id] 
  if @user_id == nil 
    redirect to '/?needlogin=true'
  else
    @user = User.find(@user_id)
    erb :user_home
  end
end


# == POST ========================

