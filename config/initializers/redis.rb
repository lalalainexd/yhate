if ENV["REDISTOGO_URL"]
  MyStory::Application.config.cache_store = :redis_store, ENV["REDISTOGO_URL"], { expires_in: 120.minutes }
end
