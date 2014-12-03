class Invitation < ActiveRecord::Base
  belongs_to :inviter, class_name: "User", foreign_key: "user_id"
end
