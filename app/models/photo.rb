class Photo < ShotwellTable
  self.table_name = 'PhotoTable'
  
  def thumbnail_filename
    result = '/var/data/photos/.shotwell/thumbs/thumbs128/thumb' + self.id.to_s(16).rjust(16, '0') + '.jpg'
    File.exists?(result) ? result : filename
  end
end
