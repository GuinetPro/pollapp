class User < ActiveRecord::Base
    validates :email, presence: true, email: true, uniqueness: true
    validates :uid, presence: true
    validates :provider, presence: true
    has_many :tokens
    has_many :my_polls
    has_many :my_apps


    def self.from_omniauth(data)
        # Recibe un hash de datos
        # { provider : 'facebook' , uid: '12345': info: { email : '' , } }

        #encuentra al usuario sino crealo

        User.where(provider: data[:provider] , uid: data[:uid]).first_or_create do |user|
            #crealo y usa el email que vienen en la data
            user.email = data[:info][:email]
        end

    end
end
