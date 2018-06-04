require 'dm-core'
require 'dm-migrations'
require 'dm-timestamps'


class Comment
	include DataMapper::Resource
	property :comment_id, Serial
	property :firstname, String, :required => true
	property :lastname, String, :required => true
	property :created_at, DateTime
	property :title, String, :required => true
	property :context, String, :required => true

	def time=date 
		super Date.strptime(date,'%m/%d/%Y')
	end
end

DataMapper.finalize


#### Comments
get '/Comments' do
	@comments = Comment.all
	erb :comment
end


get '/Comments/new' do
	comment = Comment.new
	erb :add_comment
end

post '/Comments/new' do
	comment = Comment.create(params[:comment])
	redirect to ('/Comments')
end

get '/Comments/:id' do
	@comment = Comment.get(params[:id])
	erb :detail_comment
end




