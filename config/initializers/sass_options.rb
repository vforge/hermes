# disable caching for sass plugin
require 'sass/plugin'

# disable sass cache
Sass::Plugin.options[:cache] = false
