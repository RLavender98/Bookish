using System;
using System.Linq;
using Bookish.DataAccess;

namespace Bookish.ConsoleApp
{
    internal class Program
    {
        public static void Main(string[] args)
        {
            var bookList = DataBaseQueryer.bookQuery();

            foreach (Book book in bookList)
            {
                Console.WriteLine($"Book Title: {book.Title} \tISBN: {book.Isbn}");
            }
        }
    }
}