class CreateHogeUser < ActiveRecord::Migration[5.2]
  def up
    connection.execute <<-SQL
      CREATE MATERIALIZED VIEW hoge_users AS
        SELECT
          users.name as user_name,
          users.description as description,
          companies.name as company_name
        FROM users
        INNER JOIN companies ON (users.companies_id = companies.id);
    SQL
  end

  def down
    connection.execute 'DROP MATERIALIZED VIEW IF EXISTS hoge_users'
  end
end
