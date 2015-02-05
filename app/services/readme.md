Services
========

Base class:
```
module Service
  extend ActiveSupport::Concern

  included do
    include Virtus.module

    def self.call(*args)
      new(*args).call
    end
  end
end
```

Example service:
```
class LoremTest
  include Service

  attribute :text, String

  def call
    text.inspect
  end
end

```

Call:
```
LoremTest.call('Lorem Ipsum')
```

Idea: http://brewhouse.io/blog/2014/04/30/gourmet-service-objects.html
