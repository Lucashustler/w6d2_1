class User < ApplicationRecord

    #link with events and attendances
    has_many :attendances
    has_many :events, through: :attendances

    #user mailer
    after_create :welcome_send
    def welcome_send
      UserMailer.welcome_email(self).deliver_now
    end
end
