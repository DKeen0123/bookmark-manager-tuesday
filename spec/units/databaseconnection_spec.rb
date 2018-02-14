require 'databaseconnection'

describe DatabaseConnection do
  context '#setup' do
    it 'sets up a connection to the database through PG' do 
      expect(PG).to receive(:connect).with(dbname: 'bookmark_manager_test')
      DatabaseConnection.setup('bookmark_manager_test')
    end
  end

  context '#query' do
    it 'executes a query' do
      con = DatabaseConnection.setup('bookmark_manager_test')
      expect(con).to receive(:exec).with("SELECT * FROM links")
      DatabaseConnection.query("SELECT * FROM links")
    end
  end

end
