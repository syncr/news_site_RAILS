require 'rails_helper'

describe Link do
  it { should validate_presence_of :url}
  it { should validate_uniqueness_of :url }
  it { should validate_presence_of :headline }
  it { should validate_uniqueness_of :headline }
  it { should have_many :comments}
end
