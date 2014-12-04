require 'faker'

40.times { User.create(permanent_name: Faker::Internet.user_name, password: 'password', password_confirmation: 'password') }
User.all.each { |user| user.alias = set_alias(user) }
10.times { User.create(permanent_name: Faker::Internet.user_name, password: 'password', fixed_identity: true) }
200.times { User.all.sample.messages << Message.new(body: Faker::Lorem.sentence) }
30.times { User.all.sample.invitations << Invitation.new(code: '12345')}
