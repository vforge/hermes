module Mercury
  def version
    `git describe --always`.chomp
  end
end
