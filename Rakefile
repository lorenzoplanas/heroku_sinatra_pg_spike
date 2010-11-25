require "active_record"

ActiveRecord::Base.establish_connection(
  adapter:  "postgresql",
  database: "spike",
  encoding: "unicode",
  username: "postgres",
  password: "kambiame",
  pool:     5
)

namespace :spike do
  task :migrate do
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
  end

  task :load do
  end
end
