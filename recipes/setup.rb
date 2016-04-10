# frozen_string_literal: true
#
# Cookbook Name:: opsworks_ruby
# Recipe:: setup
#

every_enabled_application do |application|
  scm = Drivers::Scm::Factory.build(application, node)
  scm.setup(self)

  every_enabled_rds do |rds|
    database = Drivers::Db::Factory.build(application, node, rds: rds)
    database.setup(self)
  end
end