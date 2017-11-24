require "activityko/version"
require "activityko/loggable"
require "activityko/view_helpers"
require 'active_record'
module Activityko
end
ActiveRecord::Base.send :extend, Activityko::Loggable
