require 'spec_helper'

describe Choice do
  it { should belong_to :answer }
  it { should belong_to :question }
end
