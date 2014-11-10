if Rails.env == 'development'
  # require 'rack-mini-profiler'
  #
  # # initialization is skipped so trigger it
  # Rack::MiniProfilerRails.initialize!(Rails.application)
  Rack::MiniProfiler.config.storage = Rack::MiniProfiler::MemoryStore
  # Have Mini Profiler show up on the right
  Rack::MiniProfiler.config.position = 'right'
  # Have Mini Profiler start in hidden mode - display with short cut (defaulted to 'Alt+P')
  Rack::MiniProfiler.config.start_hidden = true
  # Don't collect backtraces on SQL queries that take less than 5 ms to execute
  # (necessary on Rubies earlier than 2.0)
  Rack::MiniProfiler.config.backtrace_threshold_ms = 5
  Rack::MiniProfiler.config.toggle_shortcut = 'alt+d'
end
