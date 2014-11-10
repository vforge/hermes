require 'coveralls'

SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter[
    SimpleCov::Formatter::HTMLFormatter,
    Coveralls::SimpleCov::Formatter
]

SimpleCov.start 'rails' do
  add_filter '/config'
  add_filter '/spec/'
  add_filter '/features/'
  add_filter '/config/'

  add_group 'Controllers',  'app/controllers'
  add_group 'Models',       'app/models'
  add_group 'Decorators',   'app/decorators'
  add_group 'Helpers',      'app/helpers'
  add_group 'Libraries',    'lib'

  add_group 'Long files' do |src_file|
    src_file.lines.count > 100
  end
end
