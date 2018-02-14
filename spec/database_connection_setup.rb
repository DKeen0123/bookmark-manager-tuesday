require'./lib/databaseconnection'

if ENV['ENVIRONMENT'] == 'test'
  p DatabaseConnection.setup('bookmark_manager_test')
else
  DatabaseConnection.setup('bookmark_manager')
end
