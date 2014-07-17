class User
  has_one :api_key, dependent: :destroy

	after_create :create_api_key

	private

	def create_api_key
	  ApiKey.create :user => self
	end
end
