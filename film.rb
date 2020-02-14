gem 'activerecord', '=4.2.10'
require 'active_record'
require 'mini_record'

ActiveRecord::Base.establish_connection(adapter: 'sqlite3', database: 'film.sqlite3')

class Film < ActiveRecord::Base
	field :title, as: :string
	field :country, as: :string
	field :genre, as: :string
	field :rating, as: :integer
	field :description, as: :text

end

Film.auto_upgrade!