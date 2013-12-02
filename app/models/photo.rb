class Photo < ShotwellTable
  self.table_name = 'PhotoTable'

  belongs_to :event

  def thumbnail_filename
    local_filename = 'thumbs360/thumb' + self.id.to_s(16).rjust(16, '0') + '.jpg'
    if File.exists?(Rails.root.join('data/shotwell/thumbs/', local_filename))
      Rails.root.join('data/shotwell/thumbs/', local_filename)
    elsif File.exists?(Rails.root.join('data', local_filename))
      Rails.root.join('data', local_filename)
    else
      `convert "#{filename}" -thumbnail 480x360^ -gravity center -unsharp 0x.5 -extent 480x360 -auto-orient "#{Rails.root.join('data', local_filename)}"`
      Rails.root.join('data', local_filename)
    end
  end

  def name
    File.basename(filename)
  end
end
