class UserPoll < ActiveRecord::Base
  belongs_to :user
  belongs_to :my_poll
  has_many :answers

  validates :user, presence: true
  validates :my_poll, presence: true

  #crea un nuevo registro con un poll y un nuevo usuario
  #or parametro le apsamos al encuesta y el suaurio
  def self.custom_find_or_create(poll,user)
    where(my_poll: poll, user: user).first_or_create
  end

end
