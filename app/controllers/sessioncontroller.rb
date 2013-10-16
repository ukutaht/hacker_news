get '/login' do

  if authenticated?
    redirect '/'
  else
    erb :login
  end 

end

post '/login' do
  found_user = User.find_by_user_name(params[:user_name])
  user = found_user.authenticate(params[:password])

  if user
    session[:user_id] = user.id
    redirect '/'
  else
    @message = "Something went wrong"
    redirect to '/login'
  end

end

get '/signup' do
  
  if authenticated?
    redirect '/'
  else
    erb :signup
  
  end 
end

post '/signup' do
  p params
  new_user = User.create(params[:user])
  
  if new_user.valid?
    session[:user_id] = new_user.id
    redirect '/'
  else
    @message = "Something went wrong"
    redirect '/signup'
  end
end

get '/logout' do
  session.clear
  redirect '/'
end
