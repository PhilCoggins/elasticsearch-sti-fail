# README

Created to demonstrate STI failure with [elasticsearch-model](https://github.com/elastic/elasticsearch-rails/tree/master/elasticsearch-model) gem ([issue](https://github.com/elastic/elasticsearch-rails/issues/848))

## Setting up:
1. `rails db:migrate`
2. `rails runner script.rb`


## Reproducing from server:
1. `rails server`
2. Navigate to localhost:3000
3. This works
4. Trigger a rails reload (add a newline to a file in app/)
5. Refresh page
6. Should fail

## You can additionally do this from a rails console:
1. `rails console`
2. run `require_dependency 'animal'`
3. `Elasticsearch::Model.search("Fluffy").records.to_a`
4. This works
5. `reload!`
6. `Elasticsearch::Model.search("Fluffy").records.to_a`
7.  This should fail

From here, you can also check `Elasticsearch::Model::Registry.all` to see that there are two of the same classes in the registry, one of which erroneously contains no descendants.
