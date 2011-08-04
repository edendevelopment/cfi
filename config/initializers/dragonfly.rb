require 'dragonfly'

app = Dragonfly[:images]
#<<<<<<< HEAD
#app.configure_with(:rmagick)
#=======
app.configure_with(:imagemagick)
#>>>>>>> edendevelopment/master
app.configure_with(:rails)
app.configure_with(:heroku, ENV['S3_BUCKET']) unless Rails.env.development? || Rails.env.test?

app.define_macro(ActiveRecord::Base, :image_accessor)
