# encoding: utf-8
require "bundler/setup"
Bundler.require :default
@db_url = URI.parse ENV["DATABASE_URL"]

ActiveRecord::Base.establish_connection(
  adapter:  "postgresql",
  host:     @db_url.host,
  database: @db_url.path[1..-1],
  username: @db_url.user,
  password: @db_url.password,
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
