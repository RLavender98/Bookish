using System;
using System.Collections.Generic;
using System.Linq;
using Dapper;
using Npgsql;

namespace Bookish.DataAccess
{
    public class DataBaseQueryer
    {
        public static List<Book> bookQuery()
        {
            using (var connection = new NpgsqlConnection("Host=localhost;Username=postgres;Password=password;Database=bookish"))
            {
                connection.Open();
                //connection.Execute("Insert into Employee (first_name, last_name, address) values ('John', 'Smith', '123 Duane St');");
                var value = connection.Query<Book>("Select * from books;");
                return value.ToList();
            }
        }
    }
}