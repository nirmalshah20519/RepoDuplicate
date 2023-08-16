using System.Text.Json;
using System.Text.Json.Serialization;
using System.Linq;

namespace LINQ_Practice
{
    class Employee
    {
        public int EMPLOYEE_ID {get;set;}
        public string FIRST_NAME { get;set;}
        public string LAST_NAME { get;set;}
        public int SALARY { get;set;}
        public string JOINING_DATE { get;set;}
        public string DEPARTMENT { get;set;}
        public override string ToString()
        {
            string str= EMPLOYEE_ID.ToString() + '\n' + FIRST_NAME + '\n' + LAST_NAME + '\n' + SALARY.ToString() + '\n' + DEPARTMENT;
            return str;
        }
    }

    class Incentive
    {
        public int EMPLOYEE_REF_ID { get;set;}
        public string INCENTIVE_DATE { get;set;}
        public int INCENTIVE_AMOUNT { get;set;}
        public override string ToString()
        {
            string str = EMPLOYEE_REF_ID.ToString() + '\n' + INCENTIVE_DATE + '\n' + INCENTIVE_AMOUNT;
            return str;
        }

    }
    internal class Program
    {
        List<Employee> employees;
        List<Incentive> incentives;
        void GetData()
        {
            string EmpPath = @"D:\RxTaskRepository\2717-Nirmal.S-Feb23Dotnet\DotnetCore\Day6\Assignments\Assignment1\Source\LINQ_Practice\LINQ_Practice\Employee.json";
            string IncPath = @"D:\RxTaskRepository\2717-Nirmal.S-Feb23Dotnet\DotnetCore\Day6\Assignments\Assignment1\Source\LINQ_Practice\LINQ_Practice\Incentives.json";
            FileStream Emp = new FileStream(EmpPath, FileMode.Open, FileAccess.Read);
            StreamReader empRead = new StreamReader(Emp);
            string EmployeeData = empRead.ReadToEnd();
            employees = JsonSerializer.Deserialize<List<Employee>>(EmployeeData);
            FileStream Inc = new FileStream(IncPath, FileMode.Open, FileAccess.Read);
            StreamReader incRead = new StreamReader(Inc);
            string IncentivesData = incRead.ReadToEnd();
            incentives = JsonSerializer.Deserialize<List<Incentive>>(IncentivesData);

        }
        static void Main(string[] args)
        {
            Program program = new Program();
            program.GetData();
            var emp = program.employees;
            var inc = program.incentives;

            //Query 1 : 
            Console.WriteLine("Query 1 : \n");

            var res_1 = from e in emp select new
                  { 
                    fullname = e.FIRST_NAME + " "+ e.LAST_NAME,
            
            };
            foreach (var item in res_1)
            {
                Console.WriteLine(item.fullname);
            }

            //Query 2 : 
            Console.WriteLine("\n\nQuery 2 : \n");

            foreach (var item in res_1)
            {
                Console.WriteLine(item.fullname.ToUpper());
            }

            //Query 3 : 
            Console.WriteLine("\n\nQuery 3 : \n");

            foreach (var item in res_1)
            {
                Console.WriteLine(item.fullname.ToLower());
            }

            //Query 4 :
            Console.WriteLine("\nQuery 4 : \n");

            var res_2 = emp.DistinctBy(s=>s.DEPARTMENT).Select(s => new { s.DEPARTMENT });
            foreach (var item in res_2)
            {
                Console.WriteLine(item.DEPARTMENT);
            }


            //Query 5 : 
            Console.WriteLine("\nQuery 5 : \n");

            var res_3 = from e in emp select new { res = e.FIRST_NAME.Substring(0, 3) };
            foreach (var item in res_3)
            {
                Console.WriteLine(item.res);
            }

            //Query 6 : 
            Console.WriteLine("\nQuery 6 : \n");

            var res_4 = from e in emp where e.FIRST_NAME == "John" select new { res = e.FIRST_NAME.IndexOf('o')+1 };
            foreach (var item in res_4)
            {
                Console.WriteLine(item.res);
            }

            //Query 7 : 
            Console.WriteLine("\nQuery 7 : \n");

            var res_5 = from e in emp select new { res = e.FIRST_NAME.Length, e.FIRST_NAME };
            foreach (var item in res_5)
            {
                Console.WriteLine($"Length of {item.FIRST_NAME} :   {item.res}");
            }

            //Query 8 : 
            Console.WriteLine("\nQuery 8 : \n");

            var res_6 = from e in emp select new { res = e.FIRST_NAME.Replace('o', '$'), e.FIRST_NAME };
            foreach (var item in res_6)
            {
                Console.WriteLine($"Before : {item.FIRST_NAME} | After :   {item.res}");
            }


            //Query 9 : 
            Console.WriteLine("\nQuery 9 : \n");

            var res_7 = from e in emp
                        select new
                        {
                            fullname = e.FIRST_NAME + "-" + e.LAST_NAME,

                        };
            foreach (var item in res_7)
            {
                Console.WriteLine(item.fullname);
            }

            //Query 10 : 
            Console.WriteLine("\nQuery 10 : \n");

            var res_8 = from e in emp
                        select new
                        {
                            e.FIRST_NAME,
                            year = Convert.ToDateTime(e.JOINING_DATE).Year,
                            month = Convert.ToDateTime(e.JOINING_DATE).Month,
                            Date = Convert.ToDateTime(e.JOINING_DATE).Day

                        };
            foreach (var item in res_8)
            {
                Console.WriteLine($"{item.FIRST_NAME}   {item.year} {item.month}    {item.Date}");
            }

            //Query 11 : 
            Console.WriteLine("\nQuery 11 : \n");

            var res_9 = from e in emp
                        orderby e.FIRST_NAME
                        select e;
            foreach (var item in res_9)
            {
                Console.WriteLine($"{item.FIRST_NAME}   {item.LAST_NAME}    {item.DEPARTMENT}   {Convert.ToDateTime(item.JOINING_DATE).ToLongDateString()}  {item.SALARY}");
            }

            //Query 12 : 
            Console.WriteLine("\nQuery 12 : \n");

            var res_10 = from e in emp
                        orderby e.FIRST_NAME descending
                        select e;
            foreach (var item in res_10)
            {
                Console.WriteLine($"{item.FIRST_NAME}   {item.LAST_NAME}    {item.DEPARTMENT}   {Convert.ToDateTime(item.JOINING_DATE).ToLongDateString()}  {item.SALARY}");
            }

            //Query 13 : 
            Console.WriteLine("\nQuery 13 : \n");

            var res_11 = from e in emp
                         orderby e.FIRST_NAME, e.SALARY descending
                         select e;
            foreach (var item in res_11)
            {
                Console.WriteLine($"{item.FIRST_NAME}   {item.LAST_NAME}    {item.DEPARTMENT}   {Convert.ToDateTime(item.JOINING_DATE).ToLongDateString()}  {item.SALARY}");
            }

            //Query 14 : 
            Console.WriteLine("\nQuery 14 : \n");

            var res_12 = from e in emp
                         where e.FIRST_NAME == "John"
                         select e;
            foreach (var item in res_12)
            {
                Console.WriteLine($"{item.FIRST_NAME}   {item.LAST_NAME}    {item.DEPARTMENT}   {Convert.ToDateTime(item.JOINING_DATE).ToLongDateString()}  {item.SALARY}");
            }

            //Query 15 : 
            Console.WriteLine("\nQuery 15 : \n");
            var names = new List<string>() {"John", "Roy" };
            var res_13 = from e in emp
                         where names.Contains(e.FIRST_NAME)
                         select e;
            foreach (var item in res_13)
            {
                Console.WriteLine($"{item.FIRST_NAME}   {item.LAST_NAME}    {item.DEPARTMENT}   {Convert.ToDateTime(item.JOINING_DATE).ToLongDateString()}  {item.SALARY}");
            }

            //Query 16 : 
            Console.WriteLine("\nQuery 16 : \n");
            var res_14 = from e in emp
                         where !names.Contains(e.FIRST_NAME)
                         select e;
            foreach (var item in res_14)
            {
                Console.WriteLine($"{item.FIRST_NAME}   {item.LAST_NAME}    {item.DEPARTMENT}   {Convert.ToDateTime(item.JOINING_DATE).ToLongDateString()}  {item.SALARY}");
            }

            //Query 17 : 
            Console.WriteLine("\nQuery 17 : \n");
            var res_15 = from e in emp
                         where e.FIRST_NAME.StartsWith('J')
                         select e;
            foreach (var item in res_15)
            {
                Console.WriteLine($"{item.FIRST_NAME}   {item.LAST_NAME}    {item.DEPARTMENT}   {Convert.ToDateTime(item.JOINING_DATE).ToLongDateString()}  {item.SALARY}");
            }

            //Query 18 : 
            Console.WriteLine("\nQuery 18 : \n");
            var res_16 = from e in emp
                         where e.FIRST_NAME.Contains('o')
                         select e;
            foreach (var item in res_16)
            {
                Console.WriteLine($"{item.FIRST_NAME}   {item.LAST_NAME}    {item.DEPARTMENT}   {Convert.ToDateTime(item.JOINING_DATE).ToLongDateString()}  {item.SALARY}");
            }

            //Query 19 : 
            Console.WriteLine("\nQuery 19 : \n");
            var res_17 = from e in emp
                         where e.FIRST_NAME.EndsWith('n')
                         select e;
            foreach (var item in res_17)
            {
                Console.WriteLine($"{item.FIRST_NAME}   {item.LAST_NAME}    {item.DEPARTMENT}   {Convert.ToDateTime(item.JOINING_DATE).ToLongDateString()}  {item.SALARY}");
            }

            //Query 20 : 
            Console.WriteLine("\nQuery 20 : \n");
            var res_18 = from e in emp
                         where e.FIRST_NAME.EndsWith('n') && e.FIRST_NAME.Length==4
                         select e;
            foreach (var item in res_18)
            {
                Console.WriteLine($"{item.FIRST_NAME}   {item.LAST_NAME}    {item.DEPARTMENT}   {Convert.ToDateTime(item.JOINING_DATE).ToLongDateString()}  {item.SALARY}");
            }

            //Query 21 : 
            Console.WriteLine("\nQuery 21 : \n");
            var res_19 = from e in emp
                         where e.FIRST_NAME.StartsWith('J') && e.FIRST_NAME.Length == 4
                         select e;
            foreach (var item in res_19)
            {
                Console.WriteLine($"{item.FIRST_NAME}   {item.LAST_NAME}    {item.DEPARTMENT}   {Convert.ToDateTime(item.JOINING_DATE).ToLongDateString()}  {item.SALARY}");
            }

            //Query 22 : 
            Console.WriteLine("\nQuery 22 : \n");
            var res_20 = from e in emp
                         where e.SALARY>600000
                         select e;
            foreach (var item in res_20)
            {
                Console.WriteLine($"{item.FIRST_NAME}   {item.LAST_NAME}    {item.DEPARTMENT}   {Convert.ToDateTime(item.JOINING_DATE).ToLongDateString()}  {item.SALARY}");
            }

            //Query 23 : 
            Console.WriteLine("\nQuery 23 : \n");
            var res_21 = from e in emp
                         where e.SALARY <800000
                         select e;
            foreach (var item in res_21)
            {
                Console.WriteLine($"{item.FIRST_NAME}   {item.LAST_NAME}    {item.DEPARTMENT}   {Convert.ToDateTime(item.JOINING_DATE).ToLongDateString()}  {item.SALARY}");
            }

            //Query 24 : 
            Console.WriteLine("\nQuery 24 : \n");
            var res_22 = from e in emp
                         where e.SALARY>500000 && e.SALARY <800000
                         select e;
            foreach (var item in res_22)
            {
                Console.WriteLine($"{item.FIRST_NAME}   {item.LAST_NAME}    {item.DEPARTMENT}   {Convert.ToDateTime(item.JOINING_DATE).ToLongDateString()}  {item.SALARY}");
            }

            //Query 25 : 
            Console.WriteLine("\nQuery 25 : \n");
            var res_23 = from e in emp
                         where e.FIRST_NAME == "John" || e.FIRST_NAME=="Michael"
                         select e;
            foreach (var item in res_23)
            {
                Console.WriteLine($"{item.FIRST_NAME}   {item.LAST_NAME}    {item.DEPARTMENT}   {Convert.ToDateTime(item.JOINING_DATE).ToLongDateString()}  {item.SALARY}");
            }


            //Query 26 : 
            Console.WriteLine("\nQuery 26 : \n");
            var res_24 = from e in emp
                         where Convert.ToDateTime(e.JOINING_DATE).Year==2013
                         select e;
            foreach (var item in res_24)
            {
                Console.WriteLine($"{item.FIRST_NAME}   {item.LAST_NAME}    {item.DEPARTMENT}   {Convert.ToDateTime(item.JOINING_DATE).ToLongDateString()}  {item.SALARY}");
            }

            //Query 27 : 
            Console.WriteLine("\nQuery 27 : \n");
            var res_25 = from e in emp
                         where Convert.ToDateTime(e.JOINING_DATE)<new DateTime(2013/01/31)
                         select e;
            foreach (var item in res_25)
            {
                Console.WriteLine($"{item.FIRST_NAME}   {item.LAST_NAME}    {item.DEPARTMENT}   {Convert.ToDateTime(item.JOINING_DATE).ToLongDateString()}  {item.SALARY}");
            }

            //Query 28 : 
            Console.WriteLine("\nQuery 28 : \n");
            var res_26 = from e in emp
                         join i in inc on e.EMPLOYEE_ID equals i.EMPLOYEE_REF_ID
                         select new
                         {
                             incDiff=  Convert.ToDateTime(i.INCENTIVE_DATE)- Convert.ToDateTime(e.JOINING_DATE)
                         };

            foreach (var item in res_26)
            {
                Console.WriteLine($"{item.incDiff}");
            }

            //Query 29 : 
            Console.WriteLine("\nQuery 29 : \n");
            var res_27 = from e in emp
                         where e.LAST_NAME.Contains('%')
                         select e;
            foreach (var item in res_27)
            {
                Console.WriteLine($"{item.FIRST_NAME}   {item.LAST_NAME}    {item.DEPARTMENT}   {Convert.ToDateTime(item.JOINING_DATE).ToLongDateString()}  {item.SALARY}");
            }

            //Query 30 : 
            Console.WriteLine("\nQuery 30 : \n");
            var res_28 = from e in emp
                         group e by e.DEPARTMENT into deptWiseData
                         select new {
                             dept=deptWiseData.Key,
                             TotalSal=deptWiseData.Sum(x=>x.SALARY)
                         };
            foreach (var item in res_28)
            {
                Console.WriteLine($"{item.dept}   {item.TotalSal}");
            }

            //Query 31 : 
            Console.WriteLine("\nQuery 31 : \n");
            var res_29 = from e in emp
                         group e by e.DEPARTMENT into deptWiseData
                         orderby deptWiseData.Sum(x => x.SALARY) descending
                         select new
                         {
                             dept = deptWiseData.Key,
                             TotalSal = deptWiseData.Sum(x => x.SALARY)
                         };
            foreach (var item in res_29)
            {
                Console.WriteLine($"{item.dept}   {item.TotalSal}");
            }

            //Query 31 : 
            Console.WriteLine("\nQuery 31 : \n");
            var res_30 = from e in emp
                         group e by e.DEPARTMENT into deptWiseData
                         select new
                         {
                             dept = deptWiseData.Key,
                             TotalSal = deptWiseData.Average(x => x.SALARY)
                         };
            foreach (var item in res_30)
            {
                Console.WriteLine($"{item.dept}   {item.TotalSal}");
            }

            //Query 32 : 
            Console.WriteLine("\nQuery 32 : \n");
            var res_31 = from e in emp
                         group e by e.DEPARTMENT into deptWiseData
                         orderby deptWiseData.Average(x => x.SALARY)
                         select new
                         {
                             dept = deptWiseData.Key,
                             TotalSal = deptWiseData.Average(x => x.SALARY)
                         };
            foreach (var item in res_31)
            {
                Console.WriteLine($"{item.dept}   {item.TotalSal}");
            }

            //Query 33 : 
            Console.WriteLine("\nQuery 33 : \n");
            var res_32 = from e in emp
                         group e by e.DEPARTMENT into deptWiseData
                         orderby deptWiseData.Average(x => x.SALARY) descending
                         select new
                         {
                             dept = deptWiseData.Key,
                             TotalSal = deptWiseData.Average(x => x.SALARY)
                         };
            foreach (var item in res_32)
            {
                Console.WriteLine($"{item.dept}   {item.TotalSal}");
            }

            //Query 34 : 
            Console.WriteLine("\nQuery 34 : \n");
            var res_33 = from e in emp
                         group e by e.DEPARTMENT into deptWiseData
                         orderby deptWiseData.Max(x => x.SALARY)
                         select new
                         {
                             dept = deptWiseData.Key,
                             TotalSal = deptWiseData.Max(x => x.SALARY)
                         };
            foreach (var item in res_33)
            {
                Console.WriteLine($"Maximum Salary of {item.dept} Department is {item.TotalSal}");
            }

            //Query 35 : 
            Console.WriteLine("\nQuery 35 : \n");
            var res_34 = from e in emp
                         group e by e.DEPARTMENT into deptWiseData
                         orderby deptWiseData.Min(x => x.SALARY)
                         select new
                         {
                             dept = deptWiseData.Key,
                             TotalSal = deptWiseData.Min(x => x.SALARY)
                         };
            foreach (var item in res_34)
            {
                Console.WriteLine($"Minimum Salary of {item.dept} Department is {item.TotalSal}");
            }

            //Query 36 : 
            Console.WriteLine("\nQuery 36 : \n");
            var res_35 = from e in emp
                         where e.SALARY>800000
                         select new
                         {
                             e.DEPARTMENT,
                             e.SALARY,
                         };
            foreach (var item in res_35)
            {
                Console.WriteLine($"{item.DEPARTMENT}   {item.SALARY}");
            }

            //Query 37 : 
            Console.WriteLine("\nQuery 37 : \n");
            var res_37 = from e in emp
                         join i in inc on e.EMPLOYEE_ID equals i.EMPLOYEE_REF_ID
                         select new
                         {
                             name=e.FIRST_NAME + ' '+ e.LAST_NAME,
                             Incentive=i.INCENTIVE_AMOUNT
                         };
            foreach (var item in res_37)
            {
                Console.WriteLine($"{item.name}   {item.Incentive}");
            }
        }
    }
}
