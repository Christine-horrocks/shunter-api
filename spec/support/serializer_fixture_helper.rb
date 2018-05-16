require 'fileutils'

module SerializerFixtureHelper
  def get_fixture(filename, path)
    directory_name = path.chomp('.rb').split('/').insert(6, 'fixtures').join('/')
    # file_path = File.join(File.dirname(__FILE__), '../', 'fixtures', 'serializers', path)

    File.open("#{directory_name}/#{filename}.yml", 'r') { |f| f.read }
  end

  def create_fixture(serializer, filename, path)
    directory_name = path.chomp('.rb').split('/').insert(6, 'fixtures').join('/')

    Dir.mkdir(directory_name) unless File.exists?(directory_name)

    File.open("#{directory_name}/#{filename}.yml", 'w') { |f| p f.write serializer.to_yaml }
  end
end