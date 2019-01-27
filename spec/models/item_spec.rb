# frozen_string_literal: true

# spec/models/item_spec.rb
require 'rails_helper'

# Test suite for the Item model
RSpec.describe Item, type: :model do
  # Association test
  # Ensure an item record belongs to a single todo record
  it { should belong_to(:todo) }
  # Validation test
  # Ensure column name is present before saving
  it { should validate_presence_of(:name) }
end
