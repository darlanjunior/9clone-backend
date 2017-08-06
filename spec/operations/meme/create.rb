require 'rails_helper'

RSpec.describe Meme::Create do
  describe '#call' do
    subject do
      Meme::Create.(title: title, file: file)
    end

    context 'invalid form' do
      let(:title) { nil }
      let(:file) { nil }
      let(:result_validation_key) { "result.contract.default" }
      let(:errors) {{
        title: ['can\'t be blank'],
        file: ['can\'t be blank']
      }}

      it("fails") { is_expected.to be_failure }
      it("does not persist") { expect(subject["model"]).not_to be_persisted }
      it("sets validation error messages") do
        expect(subject[result_validation_key].errors.messages).to eq(errors)
      end
      it("converts errors to json and returns them") do
        expect(subject['result.json']).to eq({
          success: false,
          errors: errors
        }.to_json)
      end
    end

    context 'valid form' do
      let(:title) {'hai'}
      let(:file) {File.open('./Gemfile', 'r')}

      it("succeeds") { is_expected.to be_success }
      it("persists the model") { expect(subject["model"]).to be_persisted }
      it("sets properties") do
        expect(subject["model"].title).to eq title
        expect(subject["model"].file.filename).to eq 'Gemfile'
      end
      it("returns success") {expect(subject['result.json']).to eq({
        success: true,
        errors: []
      })}
    end

  end
end
