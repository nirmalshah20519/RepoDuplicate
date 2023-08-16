// See https://aka.ms/new-console-template for more information
namespace Assignments
{
    class Assignment5
    {
        static void Main(String[] args) {
            Console.WriteLine("Enter Age :");
            int age= Convert.ToInt32(Console.ReadLine());
            while(age<0 || age>99)
            {
                Console.WriteLine("Enter Valid Age");
                age = Convert.ToInt32(Console.ReadLine());
            }
            if (age < 18)
            {
                Console.WriteLine("Not Eligible");
            }
            else
            {
                Console.WriteLine("Eligible");
            }
        }
    }
}
