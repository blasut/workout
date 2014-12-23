require 'data_mapper'


DataMapper::setup(:default, ENV['DATABASE_URL'] || "sqlite3://#{Dir.pwd}/db/app.db")

class WorkOutOccasion
  include DataMapper::Resource
  property :id, Serial
  property :date, Date
  
  # Timestamps
  property :created_at, DateTime
  property :updated_at, DateTime

  has n, :exercises
end

class Exercise
  include DataMapper::Resource
  property :id, Serial
  property :name, Text
  property :set, Integer
  property :rep, Integer
  property :weight, Integer
  
  # Timestamps
  property :created_at, DateTime
  property :updated_at, DateTime

  belongs_to :work_out_occasion
end

DataMapper.finalize.auto_upgrade!
