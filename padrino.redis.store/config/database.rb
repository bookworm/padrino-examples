MongoMapper.connection = Mongo::Connection.new('localhost', nil, :logger => logger)

case Padrino.env
  when :development then MongoMapper.database = 'padrino_redis_store_development'
  when :production  then MongoMapper.database = 'padrino_redis_store_production'
  when :test        then MongoMapper.database = 'padrino_redis_store_test'
end
