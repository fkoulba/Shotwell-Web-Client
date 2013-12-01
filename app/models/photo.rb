class Photo < ShotwellTable
  self.table_name = 'PhotoTable'

  belongs_to :event

  def thumbnail_filename
    result = '/var/data/photos/.shotwell/thumbs/thumbs360/thumb' + self.id.to_s(16).rjust(16, '0') + '.jpg'
    File.exists?(result) ? result : filename
  end

  def name
    File.basename(filename)
  end
end
