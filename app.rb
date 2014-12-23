require 'rubygems'
require 'sinatra'
require './db_start'

get '/' do
  erb :start
end

get '/woas' do
  # Return back all the work outs
  @woas = WorkOutOccasion.all  
  erb :show_woas
end

get '/woa/:id' do
  @woa = WorkOutOccasion.get(params[:id])
  @exercises = @woa.exercises
  erb :show_woa
end

get '/add_woa' do
  @date = Time.now.localtime.strftime("%Y-%m-%d") 
  erb :add_woa
end

post '/add_woa' do
  # Create a WOA if there is not an ID
  if params[:woa_id].empty?
    w = WorkOutOccasion.new
    w.date = params[:date]
  else
    w = WorkOutOccasion.get(params[:woa_id])
  end
  # Create the new exercise and add it to the WOA
  e = w.exercises.new(:name => params[:name],
                     :set => params[:set],
                     :rep => params[:rep],
                     :weight => params[:weight])
  # Save both
  w.save
  "#{w.id}"
end

get '/stats/' do
  "To be implemented"
end

get '/woa/:id/e/:e_id' do
  @woa = WorkOutOccasion.get(params[:id])
  @exercise = @woa.exercises.get(params[:e_id])
  erb :show_woa_details
end
