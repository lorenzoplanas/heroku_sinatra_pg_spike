# encoding: utf-8
require "sinatra/base"
require "active_record"

ActiveRecord::Base.establish_connection(
  adapter:  "postgresql",
  database: "spike",
  encoding: "unicode",
  username: "postgres",
  password: "kambiame",
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
