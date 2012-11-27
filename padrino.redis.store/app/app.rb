class PadrinoRedisStore < Padrino::Application
  register Padrino::Rendering  
  register Padrino::Cache   
  register Padrino::Helpers 
  register Padrino::Admin::AccessControl
  
  ##
  # Caching support
  #
  register Padrino::Cache
  enable :caching
  set :cache, Padrino::Cache::Store::Redis.new(::Redis.new(:host => '127.0.0.1', :port => 6379, :db => 0))

  ## 
  # Access Control
  #
  access_control.roles_for :any do |role|
    role.protect '/'
    role.allow   '/sessions'
  end

  access_control.roles_for :registered, :admin do |role|
    role.allow '/'
  end
end
