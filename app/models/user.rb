class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable ,:confirmable, :lockable, :timeoutable 

<<<<<<< HEAD
  has_many :applies
=======
  has_one :apply


  has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/


   def after_confirmation
    welcome_email
    end

    def welcome_email
     Usermailer.welcome_email(self).deliver
    end


>>>>>>> dc9f5db77f39ec889326c794e3a0114214bc4d7f
end
