using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using Dapper;
using Npgsql;

namespace Bookish.DataAccess
{
    public class DataBaseQueryer
    {
        public static List<Book> bookQuery()
        {
            var connectionString = ConfigurationManager.ConnectionStrings["Bookish"].ConnectionString;
            using (var connection = new NpgsqlConnection(connectionString))
            {
                connection.Open();
                //connection.Execute("Insert into Employee (first_name, last_name, address) values ('John', 'Smith', '123 Duane St');");
                var value = connection.Query<Book>("Select * from books;");
                return value.ToList();
            }
        }
    }
}