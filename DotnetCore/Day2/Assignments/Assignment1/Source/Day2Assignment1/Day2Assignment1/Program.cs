// See https://aka.ms/new-console-template for more information
namespace Assignments
{
    class Person
    {
        static int id = 1;
        public string FirstName { get; set; }
        public int ID { get; set; }
        public string LastName { get; set; }
        public string Email { get; set; }
        public DateTime DOB { get; set; }

        public Boolean Adult;

        public readonly Boolean isTodayBirthday;
        public readonly string screenName;

        public void display()
        {
            if (Adult)
            {
                Console.WriteLine($"{FirstName} {LastName} is above 18");
            }
            else
            {
                Console.WriteLine($"{FirstName} {LastName} is not above 18");
            }

            if (isTodayBirthday)
            {
                Console.WriteLine($"Happy Birthday {FirstName} !");
            }
            else
            {
                Console.WriteLine($"Today is not the birthday of {FirstName}.");
            }

            Console.WriteLine($"Screen Name of {FirstName} {LastName} is : {screenName}");
        }

        public Person(string fname, string lname, string email, DateTime dob)
        {
            ID = id++;
            FirstName = fname;
            LastName = lname;
            Email = email;
            DOB = dob;
            if (DateTime.Now.Year - DOB.Year >= 18)
            {
                Adult = true;
            }
            else
            {
                Adult = false;
            }

            if(DateTime.Now.Date==DOB.Date && DateTime.Now.Month==DOB.Month) 
            { 
                isTodayBirthday=true;            
            }
            else
            {
                isTodayBirthday=false;
            }
            screenName= fname.ToLower().ToArray()[0].ToString() + lname.ToLower() + DOB.Month.ToString()+ DOB.Date.Day.ToString();        
        }        
    }

    class Handler
    {
        
        public List<Person> PersonList=new List<Person>();
        static void Main(string[] args)
        {
            Handler h = new Handler();
            for (int i = 0; i < 2; i++) {
                Console.WriteLine($"Person {i+1} detail");
                Console.Write("Enter first name :");
                string fname = Console.ReadLine();
                Console.Write("Enter last name :");
                string lname = Console.ReadLine();
                Console.Write("Enter email :");
                string email = Console.ReadLine();
                Console.Write("Enter Date of birth :");
                DateTime dob = Convert.ToDateTime(Console.ReadLine());
                var P=new Person(fname, lname, email, dob);
                h.PersonList.Add(P);
            }

            foreach (Person p in h.PersonList)
            {
                p.display();
            }
            



            //Console.WriteLine(Convert.ToDateTime("13/12/2001"));

        }
    }
}
