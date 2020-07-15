using System;
using System.Collections.Generic;
using System.Linq;
using Dapper;
using Npgsql;

namespace Bookish.DataAccess
{
    public class Book
    {
        public int BookId { get; set; }
        public string Title { get; set; }
        public string Isbn { get; set; }
        //public List<string> Authors { get; set; }
    }
}