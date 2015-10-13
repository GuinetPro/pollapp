class MyApp < ActiveRecord::Base
  belongs_to :user
  has_many :tokens
  validates :title, presence: true
  validates :user, presence: true
  validates :secret_key, uniqueness: true
  validates :app_id, uniqueness: true

  before_create :generate_app_id
  before_create :generate_secret_key


  def is_your_token?(token)
    #con any se sabe si devuele algo
    self.tokens.where(tokens: { id: token.id }).any?
  end

  def is_valid_origin?(domain)
    # split devuleve un arreglo separado por coma
    #include metodo de ruby si uan cadena esta en el arreglo
    self.javascript_origins.split(",").include?(domain)
  end

  private

  def generate_secret_key
    begin
        self.secret_key = SecureRandom.hex
    end while MyApp.where(secret_key: self.secret_key).any?
  end

  def generate_app_id
    begin
        self.app_id = SecureRandom.hex
    end while MyApp.where(app_id: self.app_id).any?
  end

end
