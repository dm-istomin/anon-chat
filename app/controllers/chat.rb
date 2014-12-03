get '/chat' do
  @messages = Message.all
  erb :'chat/chatroom'
end
