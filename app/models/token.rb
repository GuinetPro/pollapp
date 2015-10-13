class Token < ActiveRecord::Base
  belongs_to :user
  before_create :generate_token
  belongs_to :my_app
  #fecha actual se mayor a la fecha de expiracion
  def is_valid?
    Datetime.now < self.expires_at
    """
     = esto reasigna
     ||=primero valida q no hayamos asignado este campo y lo reasigna
    """
  end

 private

 def generate_token
    begin
        self.token = SecureRandom.hex
    end while Token.where(token: self.token).any? # busca en un do whilebusca q no exista
    self.expires_at  ||= 1.month.from_now # toma la fecha de hoy suma un mes
 end

end
