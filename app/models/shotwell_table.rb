class ShotwellTable < ActiveRecord::Base
  self.abstract_class = true
  establish_connection :adapter => 'sqlite3', :database => Rails.root.join('data/shotwell/data/photo.db')
end
