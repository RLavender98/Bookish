using System;
using System.Linq;
using Bookish.DataAccess;

namespace Bookish.ConsoleApp
{
    internal class Program
    {
        public static void Main(string[] args)
        {
            var value = DataBaseQueryer.bookQuery();
            Console.WriteLine(value.First());
        }
    }
}