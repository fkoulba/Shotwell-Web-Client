class ShotwellTable < ActiveRecord::Base
  self.abstract_class = true
  establish_connection "shotwell_#{Rails.env}"
end
