Animal.create name: "Penny"
Dog.create name: "Fluffy"

Elasticsearch::Model.client.indices.refresh index: Elasticsearch::Model::Registry.all.map(&:index_name)

