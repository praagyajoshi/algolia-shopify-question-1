require_relative '../sort_orders'

RSpec.describe AlgoliaShopify::SortOrderGenerator do
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
    let(:class_instance) { described_class.new(attributes: sample_input) }

    it 'returns the sort orders in the correct format' do
      result = class_instance.to_sort_orders
      expect(result).to eq expected_output
    end
  end
end