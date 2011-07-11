require 'dragonfly'

app = Dragonfly[:images]
#app.configure_with(:rmagick)
app.configure_with(:rails)
app.configure_with(:heroku, ENV['S3_BUCKET']) unless Rails.env.development?

app.define_macro(ActiveRecord::Base, :image_accessor)
