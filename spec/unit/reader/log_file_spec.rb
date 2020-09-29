# frozen_string_literal: true

RSpec.describe Reader::LogFile do
  subject { described_class.new.call(file_path) }

  context "when file path doesn't exist" do
    let(:file_path) { File.join($APP_ROOT_PATH, 'spec/fixtures/fake_path.log') }

    it { expect { subject }.to raise_error('There is no file for the given location.') }
  end

  context 'when file extension is different than .log' do
    let(:file_path) { File.join($APP_ROOT_PATH, 'spec/fixtures/webserver.txt') }

    it { expect { subject }.to raise_error('Unsupported file type.') }
  end

  context 'whe file path is correct' do
    let(:file_path) { File.join($APP_ROOT_PATH, 'spec/fixtures/webserver.log') }

    let(:file_handler) { instance_double(Reader::FileHandler) }

    before do
      allow(Reader::FileHandler).to receive(:new).with(file_path).and_return(file_handler)
    end

    it { is_expected.to eq(file_handler) }
  end
end
