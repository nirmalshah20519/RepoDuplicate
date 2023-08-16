namespace Day4Assignment1
{
    class Mobike
    {
        static int id = 1;
        public int Id { get; set; }
        public string BikeNo { get; set; }
        public string PhoneNo { get; set; }
        public string CustName { get; set; }
        public int Days { get; set; }
        public int charge { get; set; } = 0;

        public void input()
        {
            Console.Write("Enter Name :");
            string name = Console.ReadLine();
            Console.Write("Enter Phone No :");
            string phone = Console.ReadLine();
            Console.Write("Enter Bike No :");
            string bike = Console.ReadLine();
            Console.Write("Enter Days :");
            int days = Convert.ToInt32(Console.ReadLine());
            BikeNo = bike.Trim();
            CustName = name;
            PhoneNo = phone.Trim();
            Days=days;
            Id = id++;
            Console.WriteLine("Added Successfully !");
            Console.WriteLine("");
            Console.WriteLine("");
        }

        void compute() 
        {
            if (Days>10)
            {
                charge = (Days-10) * 200 + 5*400 + 5*500;
            }
            else if(Days>5 && Days <= 10)
            {
                charge = (Days-5)*400 + 5*500;
            }
            else
            {
                charge = Days * 500;
            }
        }
        public void display()
        {
            compute();
            Console.WriteLine($"Name : {CustName}");
            Console.WriteLine($"Bike No : {BikeNo}");
            Console.WriteLine($"Phone No : {PhoneNo}");
            Console.WriteLine($"Days : {Days}");
            Console.WriteLine($"TOTAL CHARGE  :₹ {charge}");
            Console.WriteLine("");
            Console.WriteLine("");

        }
    }
    internal class Program
    {
        List<Mobike> mobikeList=new List<Mobike>();
        void displayAll()
        {
            foreach (var item in mobikeList)
            {
                Console.WriteLine($"{item.Id}   {item.CustName} {item.BikeNo}   {item.PhoneNo} {item.Days}");
            }
        }
        Mobike display()
        {
            foreach (var item in mobikeList)
            {
                Console.WriteLine($"{item.Id}   {item.CustName}");
            }
            Console.Write("Enter ID for which you want to view charge :");
            int id=Convert.ToInt32(Console.ReadLine());
            Mobike temp = mobikeList.FirstOrDefault(x => x.Id == id);
            if (temp!=null)
            {
                return temp;
            }
            else
            {
                Console.WriteLine("Customer Not Found");
                Console.WriteLine("Kindly Enter Valid ID");
                Console.WriteLine("");
                return null;
            }
        }
        static void Main(string[] args)
        {
            Program p = new Program();
            while (true)
            {
                Console.WriteLine("1 Add Customer-Bike");
                Console.WriteLine("2 View Charge");
                Console.WriteLine("3 Delete Custumer");
                Console.WriteLine("4 View All Customers");
                Console.WriteLine("5 Exit");
                int ch=Convert.ToInt32(Console.ReadLine());
                switch(ch)
                {
                    case 1: Mobike m=new Mobike();
                            p.mobikeList.Add(m);
                            m.input();
                            break;

                    case 2: var x = p.display(); 
                            x.display();
                            break;

                    case 3: var y = p.display();
                            p.mobikeList.Remove(y);
                            Console.WriteLine("");
                            Console.WriteLine("Deleted ...");
                            Console.WriteLine("");
                            break;

                    case 4: p.displayAll();
                            break;

                    case 5: Environment.Exit(0);
                            break;

                    default:Console.WriteLine("Enter Valid Input");
                            break;
                }
            }
        }
    }
}