class FileUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick

  storage :file

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  def default_url
    '/assets/empty.png'
  end

  version :thumbnail do
    process :orient_and_strip
    process resize_to_fill: [60, 60]
  end

  version :full do
    process :orient_and_strip
  end

  def extension_white_list
    %w(jpg jpeg png)
  end

  def orient_and_strip
    manipulate! do |img|
      img.auto_orient
      img.strip # remove exif
      img = yield(img) if block_given?
      img
    end
  end
end
