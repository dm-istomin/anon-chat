require 'faker'

50.times { Alias.create(adjective: 'fake', noun: Faker::Name.title) }
available_aliases = Alias.all.shuffle
50.times { User.create(permanent_name: Faker::Internet.user_name, password: 'password', alias: available_aliases.pop) }
200.times { User.all.sample.messages << Message.new(body: Faker::Lorem.sentence) }
30.times { User.all.sample.invitations << Invitation.new(code: '12345')}
