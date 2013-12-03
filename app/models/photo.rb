class Photo < ShotwellTable
  self.table_name = 'PhotoTable'

  belongs_to :event

  def thumbnail_filename
    local_filename = 'thumbs360/thumb' + self.id.to_s(16).rjust(16, '0') + '.jpg'

    if File.exists?(path = Rails.root.join('data/shotwell/thumbs/', local_filename))
      path
    else
      `convert "#{filename}" -thumbnail 480x360^ -gravity center -unsharp 0x.5 -extent 480x360 -auto-orient "#{Rails.root.join('data/local', local_filename)}"` unless File.exists?(path = Rails.root.join('data/local', local_filename))
      path
    end
  end

  def name
    File.basename(filename)
  end
end
