require 'dm-core'
require 'dm-migrations'


class Student
	include DataMapper::Resource
	property :firstname, String, :required => true
	property :lastname, String, :required => true
	property :birthday, Date, :required => true
	property :address, String
	property :id, String, :key => true 
end

DataMapper.finalize


get '/Students' do
	@students = Student.all
	erb :students
end

get '/Students/new' do
	redirect to ('/Login_Logout') unless session[:admin]
	@login = "Login"
	@student = Student.new
	erb :add_student
end

post '/Students/new' do
	student = Student.create(params[:student])
	redirect to ('/Students')
end

get '/Students/:id' do
	@student = Student.first(id: params[:id])
	erb :detail_student
end

delete '/Students/:id' do@login = "Login"
	  redirect to("/login") unless session[:admin]
	  Student.first(id: params[:id]).destroy
	  redirect to('/Students')
end

# update student information
put '/Students/:id' do
	student = Student.first(id: params[:id])
	student.update(params[:student])
    redirect to("/Students/#{student.id}")
end


get '/Students/:id/edit' do
	@student = Student.first(id: params[:id])
	erb :edit_student
end







