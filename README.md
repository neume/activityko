# Activityko
An activity logger for rails 5. It provides view helpers to render basic format of activity.

## Installation

```ruby
gem 'activityko'
```

And then execute:

    $ bundle
Then generate model and migration files

    $ rails g activityko:install
    $ rake db:migrate

## Usage
### Owner of the Activity
Add this to your ```User``` model
```ruby
class User < ApplicationRecord
  act_as_loggable
end
```
This will add ```create_activity(action, options={})``` method to your model
### Object of the Activity
Then, make all possible objects of ```Activity``` an activty object.

```ruby
class Group < ApplicationRecord
  act_as_activity_object
end
class Location <ApplicationRecord
  act_as_activity_object
end
```
or
``` ruby
class ApplicationRecord < ActiveRecord::Base
  act_as_activity_object
end
```

An ```activity_name``` method is added to all activity objects.

The ```User``` model is also an activity object.

### View Helpers
User ``` basic_activity ``` method to display an activity

```ruby
<% @activities.each do |a| %>
  <%= basic_activity %>
<% end %>
```
or
basic_activity also accepts ```block```
```ruby
<% basic_activity @activity do%>
  <%= activity_subj %>
	<%= activity_action %>
	<%= activity_dir_obj %>
	<%= activity_prep %>
	<%= activity_prep_obj %>
	<%= activity_time %>
<% end %>
```

You can customize each activity output by using ```render_activity```. Inspired by [Public Activity](https://github.com/chaps-io/public_activity)  gem. Check it out.

```ruby
  <%= render_activity @activity%>
```
File structure
```
app:
  views:
    activities:
      <activity_obj_model>:
        _<activity_action>.html.erb
```
## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/neume/activityko. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
