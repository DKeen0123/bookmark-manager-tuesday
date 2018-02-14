require 'databaseconnection'

describe DatabaseConnection do 
  context '#setup' do 
    it 'returns a connection object' do 
      expect(described_class.setup("bookmark_manager_test")).to be_an_instance_of PG::Connection
    end
  end
end
