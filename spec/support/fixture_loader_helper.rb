module FixtureLoaderHelper
  def load_fixture(file_path)
    Rails.root.join('spec', 'fixtures', file_path)
  end
end
