using System.Collections.Generic;
using Bookish.DataAccess;

namespace WebApplication.Models
{
    public class LibraryModel
    {
        public string SearchTerm;
        public List<Book> books;

        public LibraryModel(string searchTerm)
        {
            SearchTerm = searchTerm;
        }
    }
}