class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

    #link with events and attendances
    has_many :attendances
    has_many :events, through: :attendances

    #user mailer
    after_create :welcome_send
    def welcome_send
      UserMailer.welcome_email(self).deliver_now
    end
end
