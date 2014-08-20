class Response < ActiveRecord::Base

  belongs_to :survey
  belongs_to :choice

end
