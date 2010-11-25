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
    Post.all.map { |p| "<h1>#{p.title}</h1>" }.join "\n"
  end
end
