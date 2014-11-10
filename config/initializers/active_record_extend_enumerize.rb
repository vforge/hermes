# extend ActiveRecord so it uses Enumerize by default
class ActiveRecord::Base
  extend Enumerize
end