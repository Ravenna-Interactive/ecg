# A sample Gemfile
source "http://rubygems.org"

# gem "rails"
gem "rails", '2.3.11'
gem "rake"
gem "RedCloth", ">=4.2.2"
gem "searchlogic"#, :git => "git://github.com/binarylogic/searchlogic.git", :tag => 'v2.5.8'
gem "will_paginate", "2.3.6", :git => "git://github.com/mislav/will_paginate", :tag => "2.3.6"

group :production do
  gem "mysql"
end

group :development do
  gem "mysql"
  gem "capistrano"
  gem "capistrano-ext"
  # gem "mongrel"
end

group :test do
  gem "sqlite3"
end