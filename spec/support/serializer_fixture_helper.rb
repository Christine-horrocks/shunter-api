module SerializerFixtureHelper
  def get_fixture(path)
    file_path = File.join(File.dirname(__FILE__), '../', 'fixtures', 'serializers', path)

    File.open(file_path, 'r') { |f| f.read }
  end

  def create_fixture(hash, *path)
    File.open(File.join(path), 'w') { |f| p f.write hash.to_yaml }
  end
end