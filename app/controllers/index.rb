get '/' do
  if session[:user_id]
    redirect('/chat')
  else
    redirect('/login')
  end
end
