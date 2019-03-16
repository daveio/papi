%w[
  .ruby-version
  .rbenv-vars
  .env
  tmp/restart.txt
  tmp/caching-dev.txt
].each { |path| Spring.watch(path) }
