class User < ActiveRecord::Base
  has_many :active_relationships, class_name:"Relationship",
                                  foreign_key: "challenger_id",
                                  dependent: :destroy

  has_many :passive_relationships, class_name:"Relationship",
                                  foreign_key: "challenged_id",
                                  dependent: :destroy

  has_many :challenged, through: :active_relationships, source: :challenged
  has_many :challengers, through: :active_relationships, source: :challenger

  include PgSearch
  multisearchable against: [:username, :bio, :email]

  attr_accessor :remember_token


  validates_uniqueness_of :username
  validates :username, presence: true, length: {maximum: 25}
  validates :email, { presence: true, uniqueness: true }
  validates :password, length: {minimum: 6}
  validates :bio, length: {maximum: 1000}

  has_secure_password

  def User.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                  BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end

  def User.new_token
    SecureRandom.urlsafe_base64
  end

  def authenticated?(remember_token)
    BCrypt::Password.new(remember_digest).is_password?(remember_token)
  end

  def remember
    self.remember_token = User.new_token
    update_attribute(:remember_digest, User.digest(remember_token))
  end

  def forget
    update_attribute(:remember_token, nil)
  end

  def self.text_search(query)
    results = []
    PgSearch.multisearch(query).each {|s| results << User.find(s.searchable_id)}
    results
  end


  def challenged?(other_user)
    challenged.include?(other_user)
  end


end