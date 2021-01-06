module AlgoliaShopify
  class SortOrders
    class << self
      def generate_sort_orders(attributes)
        attributes.map do |o|
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
end