# frozen_string_literal: true

RSpec.describe Writer do
  let(:writer) { described_class.new }

  let(:text_rows) do
    ['/about 4 visits', '/help_page/1 2 visits', '/home 1 visits']
  end

  let(:printed_text) do
    <<~TEXT
      /about 4 visits
      /help_page/1 2 visits
      /home 1 visits
    TEXT
  end

  it { expect { writer.call(text_rows) }.to output(printed_text).to_stdout }
end
