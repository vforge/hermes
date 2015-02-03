module Hermes
  def self.git_version
    return $git_version if $git_version

    # load the version stamped by the "build:stamp" task
    f = Rails.root.to_s + '/config/version'
    require f if File.exists?("#{f}.rb")

    begin
      $git_version ||= `git describe --always`.strip
    rescue
      $git_version = 'unknown'
    end
  end

  SYSTEM_USER_ID = -1 unless defined? SYSTEM_USER_ID

  def self.system_user
    User.where(id: SYSTEM_USER_ID).first
  end
end
