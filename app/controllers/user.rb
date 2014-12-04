post '/user/identity/hide' do
  user = User.find(session[:user_id])
  user.fixed_identity = false
  user.save

  if request.xhr?
    erb :'/user/_identity', layout: false
  else
    redirect('/')
  end
end

post '/user/identity/reveal' do
  user = User.find(session[:user_id])
  user.fixed_identity = true
  user.save

  if request.xhr?
    erb :'/user/_identity', layout: false
  else
    redirect('/')
  end
end
