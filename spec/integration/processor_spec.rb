# frozen_string_literal: true

RSpec.describe Processor do
  let(:processor) { described_class.new(data_type) }

  let(:data_type) { 'total_views' }
  let(:file_path) { File.join($APP_ROOT_PATH, 'spec/fixtures/webserver.log') }

  context 'when data_type is total_views' do
    let(:data_type) { 'total_views' }
    let(:expected_output) do
      <<~TEXT
        /help_page/1 3 visits
        /home 2 visits
        /contact 1 visits
        /about/2 1 visits
      TEXT
    end

    it 'prints total views count for each url' do
      expect { processor.call(file_path) }.to output(expected_output).to_stdout
    end
  end

  context 'when data_type is unique_views' do
    let(:data_type) { 'unique_views' }
    let(:expected_output) do
      <<~TEXT
        /help_page/1 2 unique views
        /home 2 unique views
        /contact 1 unique views
        /about/2 1 unique views
      TEXT
    end

    it 'prints unique views count for each url' do
      expect { processor.call(file_path) }.to output(expected_output).to_stdout
    end
  end

  context 'when data_type is not supported' do
    let(:data_type) { 'other' }

    it { expect { processor.call(file_path) }.to raise_error('The given type is not supported!') }
  end

  context "when file doesn't exist for the specifed file_path" do
    let(:file_path) { File.join($APP_ROOT_PATH, 'spec/fixtures/fake.log') }

    it { expect { processor.call(file_path) }.to raise_error('There is no file for the given location.') }
  end

  context 'when file type is not supported' do
    let(:file_path) { File.join($APP_ROOT_PATH, 'spec/fixtures/webserver.txt') }

    it { expect { processor.call(file_path) }.to raise_error('Unsupported file type.') }
  end
end
