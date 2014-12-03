get '/chat' do
  @messages = Message.all
  erb :'chat/chatroom'
end

get '/chat/instant/:id' do |id|

  messages = Message.where('id > ?', id)
  content = erb :'chat/_chatbox', locals: { messages: messages }, layout: false

  if messages.empty?
    nil.to_json
  else
    { latest_id: messages.last.id, content: content }.to_json
  end
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

post '/message/instant/new' do
  #..
end
