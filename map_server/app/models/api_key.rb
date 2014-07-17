class ApiKey

  include Mongoid::Document
	
	field :access_token
	
  def set_vals
    
      self.access_token = SecureRandom.hex
    
  end
end
