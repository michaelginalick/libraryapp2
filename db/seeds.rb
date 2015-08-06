require 'csv'


# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).

CSV.foreach('db/dbseed.csv', :headers => true) do |record|
  Book.create(title: record["title"], author: record["author"], genre: record["genre"], good_reads_id: record["good_reads_id"], checked_out?: record["checked_out?"])
end



admin = Admin.create(email: "admin@gmail.com", password: "mag42c84")

 