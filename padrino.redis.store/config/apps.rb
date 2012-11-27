##
# Setup global project settings for your apps. These settings are inherited by every subapp. You can
# override these settings in the subapps as needed.
#
Padrino.configure_apps do
  set :session_secret, '5401a07c8c83e8a5fd204fd29bd86fe7198f6169ebe3c28daf72cee0b6c23358'
  set :login_page,     '/sessions/new'
  set :session_id,     'customsid'
  Padrino.use Rack::Session::Redis, :redis_server => 'redis://127.0.0.1:6379/0'
end

# Mounts the core application for this project
Padrino.mount("PadrinoRedisStore").to('/')
