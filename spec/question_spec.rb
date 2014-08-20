require 'spec_helper'

describe Question do
 it { should belong_to :survey }
 it { should have_many :choices }
 it { should have_many(:answers).through(:choices) }
end
