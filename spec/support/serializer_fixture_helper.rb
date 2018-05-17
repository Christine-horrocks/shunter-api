module SerializerFixtureHelper
  def get_fixture(filename)
    File.open("#{directory_name(caller_locations.first.path)}/#{filename}.yml", 'r') { |f| f.read }
  end

  def create_fixture(serializer, filename)
    Dir.mkdir(directory_name(caller_locations.first.path)) unless File.exists?(directory_name(caller_locations.first.path))

    File.open("#{directory_name(caller_locations.first.path)}/#{filename}.yml", 'w') { |f| p f.write serializer.to_yaml }
  end

  private

  def infer_fixture_directory(path)
    path.chomp('_spec.rb').split('/').insert(6, 'fixtures').join('/')
  end

  def directory_name(path)
    infer_fixture_directory(path)
  end
end