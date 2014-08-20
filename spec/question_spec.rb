require 'spec_helper'

describe Question do
 it {should belong_to :survey }
 it {should have_and_belong_to_many :answers }
end
