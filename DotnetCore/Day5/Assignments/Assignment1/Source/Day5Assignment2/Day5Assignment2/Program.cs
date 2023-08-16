using System.ComponentModel.DataAnnotations;

namespace Day5Assignment2
{
    internal class Program
    {
        
        static void Main(string[] args)
        {
            var Area = (int length, int breadth) =>
            {
                return length * breadth;
            };
            Console.WriteLine("Area of Rectangle Using Lambda Expression");
            Console.WriteLine("");
            Console.Write("Enter Length : ");
            int length=Convert.ToInt32(Console.ReadLine());
            Console.Write("Enter Breadth : ");
            int breadth=Convert.ToInt32(Console.ReadLine());
            Console.WriteLine($"Area of Rectangle : {Area(length,breadth)}");
        }
    }
}