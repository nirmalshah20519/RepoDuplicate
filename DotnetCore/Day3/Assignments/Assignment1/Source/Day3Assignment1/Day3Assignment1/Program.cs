namespace Day3Assignment1
{
    public interface Employee
    {
        int Id { get; set; }
        string Name { get; set; }
        public int baseSalary { get; set; }        
    }

    class PartTime : Employee
    {
        public static int id = 1;
        public int Id { get; set; }
        public string Name { get; set; }
        public int baseSalary { get; set; } = 5000;

        public int Hours { get; set; }
        public int Rate { get; set; }

        public int Gross { get; set; }

        public PartTime(string name)
        {
            Id = id++;
            Name = name;
        }
        public PartTime(string name, int hours, int rate)
        {
            Id = id++;
            Name = name;
            Hours = hours;
            Rate = rate;

        }

        public void calcGross()
        {
            Gross=baseSalary+(Hours*Rate);
        }
    }

    class FullTime : Employee
    {
        public static int id = 1;
        public int Id { get; set; }
        public string Name { get; set; }
        public int baseSalary { get; set; } = 5000;

        public double Gross { get; set; }

        public FullTime(string name)
        {
            Id = id++;
            Name = name;
        }
        public FullTime(string name, int baseSal)
        {
            Id = id++;
            Name = name;
            baseSalary += baseSal;
        }

        public double calcHRA() {
            return Convert.ToDouble( baseSalary )* (0.10);
        }

        public double calcPF()
        {
            return Convert.ToDouble(baseSalary) * (0.12);
        }

        public void calcGross()
        {
            Gross = Convert.ToDouble(baseSalary) + calcHRA() - calcPF();
        }
    }
    internal class Program
    {
        public void ptime()
        {
            Console.Write("Enter Name :");
            string name=Console.ReadLine();
            Console.Write("Enter Hours :");
            int hours = Convert.ToInt32( Console.ReadLine());
            Console.Write("Enter Rate :");
            int rate = Convert.ToInt32(Console.ReadLine());
            PartTime p=new PartTime(name, hours, rate);
            p.calcGross();
            Console.WriteLine($"Gross Salary of {p.Name} is : {p.Gross}");

        }
        public void ftime()
        {
            Console.Write("Enter Name :");
            string name = Console.ReadLine();
            Console.Write("Enter Base Salary :");
            int baseSal = Convert.ToInt32(Console.ReadLine());
            FullTime f=new FullTime(name, baseSal);
            f.calcGross();
            Console.WriteLine($"HRA of {f.Name} is : {f.calcHRA()}");
            Console.WriteLine($"PF of {f.Name} is : {f.calcPF()}");
            Console.WriteLine($"Gross Salary of {f.Name} is : {f.Gross}");

        }
        static void Main(string[] args)
        {
            while (true)
            {
                Program program = new Program();
                Console.WriteLine("Enter 1 for PartTime");
                Console.WriteLine("Enter 2 for FullTime");
                Console.WriteLine("Enter 3 for Exit");
                int ch = Convert.ToInt32(Console.ReadLine());
                switch(ch)
                {
                    case 1: program.ptime();
                        break;
                    case 2: program.ftime(); 
                        break;
                    case 3:Environment.Exit(0);
                        break;
                    default:Console.WriteLine("Enter Valid Input");
                        break;
                }
            }
        }
    }
}