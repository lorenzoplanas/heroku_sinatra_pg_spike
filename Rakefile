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

namespace :spike do
  class Post < ActiveRecord::Base; end
  class CreatePosts < ActiveRecord::Migration
    def self.up
      create_table :posts do |t|
        t.string :title
        t.string :content
      end
    end

    def self.down
      drop_table :posts
    end
  end

  task :migrate do
    CreatePosts.up
    Post.create(title: "foo", content: "foo")
  end

  task :wipe do
    CreatePosts.down
  end

  task :load do
  end
end
