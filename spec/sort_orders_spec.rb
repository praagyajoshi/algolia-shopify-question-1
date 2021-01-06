require_relative '../sort_orders'

RSpec.describe AlgoliaShopify::SortOrders do
  context '#generate_sort_orders' do
    let(:sample_input) do
      [
        {
          title: 'recently_ordered',
          id: 1
        },
        {
          title: 'discounted',
          id: 2
        }
      ]
    end
    let(:expected_output) do
      [
        {
          title: 'recently_ordered',
          key: "unique_key_1",
          asc: {
            active: false,
            title: "recently_ordered asc"
          },
          desc: {
            active: false,
            title: "recently_ordered desc"
          }
        },
        {
          title: 'discounted',
          key: "unique_key_2",
          asc: {
            active: false,
            title: "discounted asc"
          },
          desc: {
            active: false,
            title: "discounted desc"
          }
        }
      ]
    end

    it 'returns the sort orders in the correct format' do
      result = described_class::generate_sort_orders(sample_input)
      expect(result).to eq expected_output
    end
  end
end