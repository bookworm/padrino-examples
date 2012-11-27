# Introduction

An example app showing how to setup padrino-cache and sessions to use Redis

# Gotchas

- Do not enable :sessions. 
  Calling `enable :sessions` or `set :sessions, true` will cause sinatra to use Rack::Session::Cookie
- Padrino Flash doesn't work without Rack::Session::Cookie
  You can overcome this by using sinatra-flash or by using the following [commit](https://github.com/bookworm/padrino-framework/commit/db00ff368b1e465676011333aeb202046604015f)
- You have to set the session_id after registering Padrino::Admin::AccessControl
  With a lot of apps this could get repetitive, so I have made a fix for this [here](https://github.com/bookworm/padrino-framework/commit/ba244973096e5dfbb7350c91b53296093be41b36)
- Make sure to use redis-rack and not redis-store. 
  See this [open issue](https://github.com/jodosha/redis-store/issues/141)
