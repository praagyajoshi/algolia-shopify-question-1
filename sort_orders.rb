# SortOrderGenerator creates objects using which we can generate sort orders
# on Algolia. It expects an array of `attributes` of the following shape:
# [
#   {
#     title: 'some_title',
#     id: 1
#   },
#   ...
# ]
# and returns an array of sort orders of the following shape:
# [
#   {
#     title: 'some_title',
#     key: "unique_key_1",
#     asc: {
#       active: false,
#       title: "some_title asc"
#     },
#     desc: {
#       active: false,
#       title: "some_title desc"
#     }
#   },
#   ...
# ]
module AlgoliaShopify
  class SortOrderGenerator
    def initialize(attributes:)
      @attributes = attributes
    end

    def to_sort_orders
      @attributes.map do |o|
        {
          title: o[:title],
          key: "unique_key_#{o[:id]}",
          asc: {
            active: false,
            title: "#{o[:title]} asc"
          },
          desc: {
            active: false,
            title: "#{o[:title]} desc"
          }
        }
      end
    end
  end
end