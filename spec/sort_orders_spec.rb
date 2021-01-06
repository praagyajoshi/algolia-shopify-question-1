require_relative '../sort_orders'

RSpec.describe AlgoliaShopify::SortOrderGenerator do
  context '#generate_sort_orders' do
    let(:sample_timestamp) { 'sample_timestamp' }
    let(:sample_input) do
      [
        {
          title: 'recently_ordered',
          id: 1,
          skip: false
        },
        {
          title: 'discounted',
          id: 2,
          skip: true
        }
      ]
    end
    let(:expected_output) do
      [
        {
          title: 'recently_ordered',
          key: "unique_key_1",
          metadata: "created_at: #{sample_timestamp}",
          asc: {
            active: false,
            title: "recently_ordered asc"
          },
          desc: {
            active: false,
            title: "recently_ordered desc"
          }
        }
      ]
    end
    let(:class_instance) do
      described_class.new(
        attributes: sample_input,
        include_desc_sort_orders: true
      )
    end

    before do
      allow(Time).to receive(:now).and_return(sample_timestamp)
    end

    it 'returns the sort orders in the correct format' do
      result = class_instance.to_sort_orders
      expect(result).to eq expected_output
    end
  end
end