require 'rails_helper'
require 'shoulda-matchers'
require 'shoulda-context'

describe Article do
  it { should validate_presence_of(:title) }
end