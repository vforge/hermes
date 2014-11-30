def git_version
  `git describe --always`.chomp
end
