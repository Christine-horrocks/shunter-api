require 'fileutils'

module SerializerFixtureHelper
  def get_fixture(path)
    file_path = File.join(File.dirname(__FILE__), '../', 'fixtures', 'serializers', path)

    File.open(file_path, 'r') { |f| f.read }
  end

  def create_fixture(hash, *path)
    file_path = File.join(path)
    directory_name = File.dirname(file_path)

    Dir.mkdir(directory_name) unless File.exists?(directory_name)

    File.open(File.join(path), 'w') { |f| p f.write hash.to_yaml }
  end
end