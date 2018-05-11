module IntegrationFixtureHelper
  def get_fixture(path)
    file_path = File.join(File.dirname(__FILE__), '../', 'fixtures', 'controllers', path)

    File.open(file_path, 'r') { |f| f.read }
  end
end
