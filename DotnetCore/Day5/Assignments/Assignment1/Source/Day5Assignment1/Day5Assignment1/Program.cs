namespace Day5Assignment1
{
    internal class Program
    {
        delegate int calcArea(int length, int breadth);

        public int RectangleArea(int length, int breadth)
        {
            return length * breadth;
        }
        static void Main(string[] args)
        {
            Program program = new Program();
            Console.WriteLine("Area of Rectangle Using Deligate : ");
            Console.Write("Enter Length : ");
            int l=Convert.ToInt32(Console.ReadLine());
            Console.Write("Enter Breadth : ");
            int b=Convert.ToInt32(Console.ReadLine());
            calcArea rectangle = new calcArea(program.RectangleArea);
            Console.WriteLine($"Area of Rectancle : {rectangle(l, b)} sq units");
        }
    }
}