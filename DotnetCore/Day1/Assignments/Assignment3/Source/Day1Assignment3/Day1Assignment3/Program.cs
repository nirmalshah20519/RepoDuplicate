// See https://aka.ms/new-console-template for more information
namespace assignment
{
    class Assignment3
    {
        enum week
        {
            Sunday = 1,
            Monday,
            Tuesday,
            Wednesday,
            Thursday,
            Friday,
            Saturday
        }
        static void Main(String[] arg)
        {
            Console.WriteLine("Enter Week Number");
            int weekDayNum = Convert.ToInt32(Console.ReadLine());
            while(weekDayNum<=0 || weekDayNum>=8) {
                Console.WriteLine("Enter Valid Week Number");
                Console.WriteLine("Enter Week Number");
                weekDayNum = Convert.ToInt32(Console.ReadLine());
            }
            Console.WriteLine((week)weekDayNum);

        }
    }
}

