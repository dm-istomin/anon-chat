require 'faker'

50.times { User.create(permanent_name: Faker::Internet.user_name, password: 'password') }
User.all.each { |user| user.alias = set_alias(user) }
200.times { User.all.sample.messages << Message.new(body: Faker::Lorem.sentence) }
30.times { User.all.sample.invitations << Invitation.new(code: '12345')}
