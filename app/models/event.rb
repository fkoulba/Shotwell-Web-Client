class Event < ShotwellTable
  self.table_name = 'EventTable'

  has_many :photos
end
