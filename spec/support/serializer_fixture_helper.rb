require 'fileutils'

module SerializerFixtureHelper
  def get_fixture(filename, path)
    directory_name = path.chomp('_spec.rb').split('/').insert(6, 'fixtures').join('/')
    File.open("#{directory_name}/#{filename}.yml", 'r') { |f| f.read }
  end

  def create_fixture(serializer, filename, path)
    directory_name = path.chomp('_spec.rb').split('/').insert(6, 'fixtures').join('/')

    Dir.mkdir(directory_name) unless File.exists?(directory_name)

    File.open("#{directory_name}/#{filename}.yml", 'w') { |f| p f.write serializer.to_yaml }
  end
end