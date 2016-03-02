class User < ActiveRecord::Base
    before_save { self.email = email.downcase }
    
    validates :name, presence: true, length: { maximum: 50 }
    
    
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
    validates :email, presence: true,
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
  has_secure_password
  
  validates :password, length: { minimum: 6 }
  
  
    has_attached_file :avatar,
                  styles: { thumb: ["128x256#", :jpg],
                            original: ['500x500>', :jpg] },
                  convert_options: { thumb: "-quality 75 -strip",
                                     original: "-quality 85 -strip" }
                                     
    validates_attachment :avatar,
                     content_type: { content_type: ["image/jpeg", "image/gif", "image/png"] }
                     
    
end

