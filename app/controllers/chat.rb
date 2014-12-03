get '/chat' do
  @messages = Message.last(100)
  erb :'chat/chatroom'
end
