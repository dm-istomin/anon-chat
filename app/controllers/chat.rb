get '/chat' do
  @messages = Message.last(100)
  erb :'chat/chatroom'
end

post '/message/new' do
  text = params[:message]
  user = User.find(session[:user_id])

  new_message = Message.new(body: text, sender: user)

  if new_message.save
    redirect('/chat')
  else
    session[:error] = new_message.errors.messages
    redirect('/chat')
  end
end
