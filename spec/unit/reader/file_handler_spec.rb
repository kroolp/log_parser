# frozen_string_literal: true

RSpec.describe Reader::FileHandler do
  subject { described_class.new(file_path) }

  let(:file_path) { File.join($APP_ROOT_PATH, 'spec/fixtures/webserver.log') }

  let(:file_lines) do
    [
      '/help_page/1 126.318.035.038',
      '/contact 184.123.665.067',
      '/home 184.123.665.067',
      '/about/2 444.701.448.104',
      '/help_page/1 929.398.951.889',
      '/home 444.701.448.104',
      '/help_page/1 126.318.035.038'
    ]
  end

  it { is_expected.to be_a(Enumerable) }
  it { expect(subject.to_a).to eq(file_lines) }
end
