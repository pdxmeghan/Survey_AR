require 'spec_helper'

describe Answer do
  it { should have_many(:questions).through(:choices) }

end
