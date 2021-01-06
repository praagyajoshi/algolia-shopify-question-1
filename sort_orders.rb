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
    def initialize(attributes:, include_desc_sort_orders: false)
      @attributes = attributes
      @include_desc_sort_orders = include_desc_sort_orders
    end

    def to_sort_orders
      selected_attributes = @attributes.select(&:should_create_sort_order!)

      selected_attributes.map do |o|
        sort_order = {
          title: o[:title],
          key: "unique_key_#{o[:id]}",
          metadata: "created_at: #{Time.now}",
          asc: {
            active: false,
            title: "#{o[:title]} asc"
          }
        }

        if @include_desc_sort_orders
          sort_order[:desc] = {
            active: false,
            title: "#{o[:title]} desc"
          }
        end

        sort_order
      end
    end

    private

    def should_create_sort_order!(attribute)
      attribute[:skip] != true
    end
  end
end
