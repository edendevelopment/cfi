# Require the preresolved locked set of gems.
bundle_path = File.expand_path('../../.bundle/environment', __FILE__)
if File.exists? bundle_path
  require bundle_path
else
  # Fallback on doing the resolve at runtime.
  require "rubygems"
  require "bundler"
  Bundler.setup
end