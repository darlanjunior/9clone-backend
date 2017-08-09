require 'rails_helper'

RSpec.describe Page::List do
  describe '#fields_to_sql' do
    subject do
      Page::List.new.send(:fields_to_sql, [:a, :b])
    end

    it 'returns a sql query with each field' do
      is_expected.to eq "a like ? or b like ?"
    end
  end

  describe '#search_term_to_sql' do
    subject do
      Page::List.new.send(:search_term_to_sql, 'search_term', 5)
    end

    it 'returns `%term%` n times' do
      is_expected.to eq(['%search_term%']*5)
    end
  end

  describe '#assemble_query!' do
    let(:options) {{}}

    before do
      params = {
        search_term: 'search',
        searchable_fields: [:a,:b]
      }

      Page::List.new.send(:assemble_query!, options, params: params)
    end
    it 'adds the search query to options' do
      expect(options[:query]).to eq 'a like ? or b like ?'
    end
  end

  describe '#call' do
    let(:model) { double() }

    before do # Mock methods and return self
      allow(model).to receive(:where) { model }
      allow(model).to receive(:order) { model }
      allow(model).to receive(:offset) { model }
      allow(model).to receive(:limit) { model }
    end

    after(:each) { subject } # ensures mock expectations are called

    subject {
      Page::List.(**required, **aditional)
    }

    context 'with search and ordering' do
      let(:required) {{
        searchable_fields: [:field_a, :field_b],
        page: 5,
        items_per_page: 10,
        model: model,
      }}

      let(:aditional) {{
        order_by: :field_a,
        search_term: 'search'
      }}

      let(:query) { 'field_a like ? or field_b like ?' }
      let(:term) { '%search%' }

      it { expect(model).to receive(:where).with(query, term, term) }
      it { expect(model).to receive(:offset).with(4*10) }
      it { expect(model).to receive(:limit).with(10) }
      it { expect(model).to receive(:order).with(:field_a) }
      it { is_expected.to be_success }
      it { expect(subject[:result]).to eq(model) }
    end

    context 'with no search and no ordering' do
      let(:required) {{
        searchable_fields: [:field_a, :field_b],
        page: 5,
        items_per_page: 10,
        model: model,
      }}

      let(:aditional) {{}}

      it { expect(model).to_not receive(:where) }
      it { expect(model).to_not receive(:order) }
      it { expect(model).to receive(:offset).with(4*10) }
      it { expect(model).to receive(:limit).with(10) }
      it { is_expected.to be_success }
      it { expect(subject[:result]).to eq(model) }
    end
  end
end
