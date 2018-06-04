source :rubygems

gem "sinatra"

gem "sass"

gem "dm-core"

gem "dm-migrations"

gem "dm-timestamps"

gem "thin"

gem 'compass-aurora', '~>3.0.0'
gem 'toolkit', '~>1.0.0'
gem 'singularitygs', '~>1.0.7'
gem 'breakpoint', '~>2.0.2'
gem 'sassy-buttons', '~>0.1.4'
gem 'compass-normalize', '~>1.4.3'

gem "pg", :group => :production

gem "dm-postgres-adapter"

gem "dm-sqlite-adapter", :group => :development

group :production do
  gem 'pg'
  gem 'dm-postgres-adapter'
  gem 'do_postgres'
end

group :development do
  gem 'sqlite3'
  gem 'dm-sqlite-adapter'
end