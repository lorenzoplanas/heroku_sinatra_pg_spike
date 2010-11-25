# encoding: utf-8
require "bundler/setup"
Bundler.require :default

ActiveRecord::Base.establish_connection(
  adapter:  "postgresql",
  database: "spike",
  encoding: "unicode",
  pool:     5
)

class Post < ActiveRecord::Base; end

class AR < Sinatra::Base
  get '/' do
    @posts = Post.all
    erb :index 
  end
end

__END__

@@ index
<% for post in @posts %>
  <h1><%= post.title %></h1>
<% end %>
