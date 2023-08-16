// See https://aka.ms/new-console-template for more information
using System.Diagnostics;
using System.Net;
using System.Xml.Linq;

namespace Assignment
{
   
    class Student
    {
        public int Id { get; set; }
        public string Name { get; set; }
        public string Address { get; set; }
        public int Hindi { get; set; }
        public int English { get; set; }
        public int Maths { get; set; }
        public int Total {get; set; }
        enum grades
        {
            AA, //90+
            AB, //80+
            BB, //70+
            BC, //60+
            CC, //50+
            CD  //40+
        }

        public int getGrade(){
            Total=Hindi+English+Maths;
            int Avg = Total / 3;
            if( Avg >= 90)
            {
                return (int)grades.AA;
            }
            else if( Avg >= 80 && Avg < 90) {
                return (int)grades.AB;
            }
            else if (Avg >= 70 && Avg < 80)
            {
                return (int)grades.BB;
            }
            else if(Avg >= 60 &&  Avg < 70)
            {
                return (int)grades.BC;
            }
            else if (Avg >= 50 && Avg < 60)
            {
                return (int)grades.CC;
            }
            else
            {
                return (int)grades.CD;
            }
        }

        public void display() {
            int grade = getGrade();
            Console.WriteLine($"{Name}  |   {Address}   |   {Hindi} |   {English}  |   {Maths} |   {Total} |   {(grades) grade}");            
        }
    }
    class Assignment4
    {
        static void Main(String[] args)
        {
            Student[] studentData = new Student[10];
            for (int i = 0; i < studentData.Length; i++)
            {
                studentData[i]= new Student();
                studentData[i].Id = i + 1;
                Console.WriteLine($"Enter Student {i + 1} Data :");
                Console.WriteLine("Name :");
                studentData[i].Name = Console.ReadLine();
                Console.WriteLine("Address :");
                studentData[i].Address = Console.ReadLine();
                Console.WriteLine("Hindi Marks :");
                studentData[i].Hindi = Convert.ToInt32(Console.ReadLine());
                Console.WriteLine("English Marks :");
                studentData[i].English = Convert.ToInt32(Console.ReadLine());
                Console.WriteLine("Maths Marks :");
                studentData[i].Maths = Convert.ToInt32(Console.ReadLine());
                Console.WriteLine(" ");
                Console.WriteLine(" ");
            }
            Console.WriteLine( "Result of the students");

            Console.WriteLine("Name     |   Address |Hindi|English|Maths|Total|grade");
            for (int i = 0; i < studentData.Length; i++)
            {
                studentData[i].display();
            }
        }
    }
}