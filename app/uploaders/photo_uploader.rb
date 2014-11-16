class PhotoUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick
  
  storage :file
  
  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end
  
  def default_url
    "/assets/empty.png"
  end
  
  version :thumbnail do
    process :auto_orient
    process resize_to_fill: [60, 60]
  end
  def extension_white_list
    %w(jpg jpeg png)
  end

  def auto_orient
    manipulate! do |img|
      img.auto_orient
      #img = img.gaussian_blur 5
      img = yield(img) if block_given?
      img
    end
  end
end
