using System;
using System.Collections.Generic;
using System.Linq;
using Dapper;
using Npgsql;

namespace Bookish.DataAccess
{
    public class Book
    {
        public string Name { get; set; }
        public string Isbn { get; set; }
        public List<string> Authors { get; set; }
        
        
    }
    
    
}