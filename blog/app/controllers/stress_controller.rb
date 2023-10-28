class StressController < ApplicationController
  def mongo
    Post.create(title: Faker.name, body: Faker::Books::Dune.saying)
    render json: Post.order_by([:id, :desc]).limit(500).map(&:to_json)
  end

  def elastic
    ElasticSearch.index(index: 'posts', body: { title: Faker.name, saying: Faker::Books::Dune.saying, quote: Faker::Books::Dune.quote })
    render json: ElasticSearch.search(index: 'posts', body: { size: 500, query: { match_all: {} } }).body
  end
end