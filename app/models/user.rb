class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,:omniauthable, omniauth_providers: [:facebook, :google_oauth2]
       

  validates :nickname, :first_name, :first_name_reading, :last_name, :last_name_reading, :telephone, :birth_year, :birth_month, :birth_day, presence: true
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, uniqueness: true, format: { with: VALID_EMAIL_REGEX }
  validates :password, length: { minimum: 8 }
  has_one  :address
  has_many :items
  has_many :orders,dependent: :destroy
  has_many :profits
  has_many :points
  has_many :communicatiuons,dependent: :destroy
  has_many :likes,dependent: :destroy
  has_many :flags,dependent: :destroy
  has_many :message_items,through: :messages,source: :items
  has_many :like_items,through: :likes,source: :items
  has_many :flag_items,through: :flags,source: :items
  has_many :todo_lists
  has_many :sns_credentials
  
  def self.from_omniauth(auth)
    sns = SnsCredential.where(provider: auth.provider, uid: auth.uid).first_or_create
    # sns認証したことがあればアソシエーションで取得
    # 無ければemailでユーザー検索して取得orビルド(保存はしない)
    user = sns.user || User.where(email: auth.info.email).first_or_initialize(
      nickname: auth.info.name,
        email: auth.info.email
    )
    # userが登録済みの場合はそのままログインの処理へ行くので、ここでsnsのuser_idを更新しておく
    if user.persisted?
      sns.user = user
      sns.save
    end
    { user: user, sns: sns }
  end
end