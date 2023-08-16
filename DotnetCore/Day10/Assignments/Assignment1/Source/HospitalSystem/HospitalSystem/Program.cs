using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using HospitalSystem;
using Microsoft.EntityFrameworkCore;

namespace HospitalSystem
{
    class DB
    {
        private HospitalSystem Context { get; set; }
        public DB()
        {
            Context = new HospitalSystem();
        }

        //DEPARTMENT CRUD 
        public void AddDepartment(string depName)
        {
            Context.DEPARTMENTs.Add(new DEPARTMENT() { DeptName = depName });
            Context.SaveChanges();
            Console.WriteLine($" {depName} Department Added !! \n");
        }

        public List<DEPARTMENT> GetDEPARTMENTs()
        {
            return Context.DEPARTMENTs.ToList();
        }
        
        //HospitalEmployee CRUD 

        public List<HospitalEmployee> GetHospitalEmployees()
        {
            return Context.HospitalEmployees.ToList();
        }
        public void AddEmployee(HospitalEmployee emp)
        {
            Context.HospitalEmployees.Add(emp);
            Context.SaveChanges();
            Console.WriteLine($"{emp.EName} added !");
        }

        //ATTENDEE CRUD 
        public List<ATTENDEE> GetAttendees() 
        { 
            return Context.ATTENDEEs.ToList();
        }

        //Patient CRUD
        public void AddPatient(Patient p)
        {
            Context.Patients.Add(p);
            Context.SaveChanges();
            Console.WriteLine($"{p.PatientName} added !");
        }

        public List<Patient> GetPatientList()
        {
            return Context.Patients.ToList();
        }

        //DRUG CRUD 

        public void AddDrug(Drug d) {
            Context.Drugs.Add(d);
            Context.SaveChanges();
            Console.WriteLine($"{d.DrugName} Drug Added !");
        }
        public List<Drug> GetDrugs()
        {
            return Context.Drugs.ToList();
        }

        //ADMIT CRUD 
        public void AdmitPatient(Attending at)
        {
            Context.Attendings.Add(at);
            Context.SaveChanges();
        }
    }
    internal class Program
    {

        public void AddDepartment()
        {
            var db=new DB();
            Console.Write("Enter Department Name : ");
            string depName=Console.ReadLine();
            db.AddDepartment(depName);

        }
        public void GetDepartments()
        {
            var db = new DB();
            var depts=db.GetDEPARTMENTs();
            Console.WriteLine("## Departments :");
            foreach (var item in depts)
            {
                Console.WriteLine($"{item.DeptID}\t{item.DeptName}");
            }
            Console.WriteLine("");
        }

        public void AddEmployee()
        {
            var db = new DB();
            Console.Write("Enter Employee Name : ");
            string empName = Console.ReadLine();
            Console.WriteLine("Enter Employee Type : ");
            var type = db.GetAttendees();
            foreach (var item in type)
            {
                Console.WriteLine($"{item.TypeID}\t for \t{item.TypeName}");
            }
            int TypeCh=Convert.ToInt32(Console.ReadLine());
            Console.WriteLine("Enter Department : ");
            var depts = db.GetDEPARTMENTs();
            foreach (var item in depts)
            {
                Console.WriteLine($"{item.DeptID}\tfor\t{item.DeptName}");
            }
            int DeptCh = Convert.ToInt32(Console.ReadLine());
            HospitalEmployee employee = new HospitalEmployee() { EName=empName, DeptID=DeptCh, EmpTypeID=TypeCh};
            db.AddEmployee(employee);

        }
        public void GetEmployees()
        {
            var db = new DB();
            var emps = db.GetHospitalEmployees();
            var type=db.GetAttendees();
            var depts=db.GetDEPARTMENTs();
            var employees = from emp in emps
                            join ty in type on emp.EmpTypeID equals ty.TypeID
                            join dep in depts on emp.DeptID equals dep.DeptID
                            select new
                            {
                                ID = emp.EID,
                                Name = emp.EName,
                                EmpType = ty.TypeName,
                                DepName=dep.DeptName
                            };
            Console.WriteLine("## Employees :");
            foreach (var item in employees)
            {
                Console.WriteLine($"{item.ID}\t{item.Name}\t{item.EmpType}\t\t\t{item.DepName} Department");
            }
            Console.WriteLine("");
        }
        public void AdmitPatient(int PID, int depID)
        {
            var db = new DB();
            
            var emp = db.GetHospitalEmployees();
            var dept = db.GetDEPARTMENTs();
            var res = from empl in emp
                      join dep in dept on empl.DeptID equals dep.DeptID
                      where empl.DeptID == depID
                      select new
                      {
                          empl,
                          depName=dep.DeptName

                      };
            if (res.Count() == 0)
            {
                Console.WriteLine("No Doctor Available");
            }
            else
            {
                Console.Write("Select Doctor to assign : ");
                foreach (var item in res)
                {
                    Console.WriteLine($"{item.empl.EID}\t{item.empl.EName}\t{item.depName}");
                }
                Console.Write("Enter Emp ID : ");
                int docID = Convert.ToInt32(Console.ReadLine());
                var selEmp = db.GetHospitalEmployees().FirstOrDefault(x => x.EID == docID);
                Attending at = new Attending() { PatientID = PID, AttendeeID = selEmp.EID, AttendeeTypeID = (int)selEmp.EmpTypeID };
                db.AdmitPatient(at);
            }
            

        }
        public void AddPatient()
        {
            var db = new DB();
            Console.Write("Enter Patient Name : ");
            string patName = Console.ReadLine();
            Console.Write("Enter Patient's Date of Birth in dd/mm/yyyy format : ");
            var dob = Convert.ToDateTime(Console.ReadLine());
            Console.Write("Enter Patient's Height in cms : ");
            var height = Convert.ToInt32(Console.ReadLine());
            Console.Write("Enter Patient's Weight in kgs : ");
            var weight = Convert.ToInt32(Console.ReadLine());
            Console.WriteLine("Patient is to be admitted in which Department : ");
            var depts = db.GetDEPARTMENTs();
            foreach (var item in depts)
            {
                Console.WriteLine($"Enter {item.DeptID} for {item.DeptName} Department");
            }
            int DeptCh = Convert.ToInt32(Console.ReadLine());
            Patient p = new Patient() { PatientName = patName, DOB = dob, Height_in_cms_ = height, Weight_in_kg_ = weight, DeptID = DeptCh };
            db.AddPatient(p);
            Console.Write("Want to Admit Patient. (Yes/No) : ");
            string resp=Console.ReadLine().ToLower();
            if (resp == "yes")
            {
                AdmitPatient(db.GetPatientList().Count, DeptCh);
            }
        }
        public void GetPatients()
        {
            var db=new DB();
            var patients=db.GetPatientList();
            var depts = db.GetDEPARTMENTs();
            var res = from pat in patients
                      join dep in depts on pat.DeptID equals dep.DeptID
                      select new
                      {
                          pat.PatientID,
                          pat.PatientName,
                          pat.DOB,
                          pat.Weight_in_kg_,
                          pat.Height_in_cms_,
                          dep.DeptName
                      };
            Console.WriteLine("## Patients");
            foreach (var item in res)
            {
                Console.WriteLine($"{item.PatientID}\t{item.PatientName}\t{item.DOB.ToShortDateString()}\tWeight : {item.Weight_in_kg_} kgs\tHeight : {item.Height_in_cms_} cms\t{item.DeptName}");
            }
        }
        public void AddDrug()
        {
            var db=new DB();
            Console.Write("Enter Name of Drug : ");
            string drName=Console.ReadLine();
            Console.Write("Enter Take time of Drug (morning/ afternoon/ evening/ night) : ");
            string takeTime=Console.ReadLine().ToLower();
            Drug drug = new Drug() {DrugName=drName, TakeAt=takeTime };
            db.AddDrug(drug);
        }
        public void GetDrugs()
        {
            var db=new DB();
            var drugs=db.GetDrugs();
            Console.WriteLine("Drugs : ");
            foreach (var item in drugs)
            {
                Console.WriteLine($"{item.DrugID}\t{item.DrugName}\t{item.TakeAt}");
            }
        }

        static void Main(string[] args)
        {
            Program program = new Program();
            //program.GetDepartments();
            //program.GetEmployees();
            //program.AddEmployee();
            //program.AddPatient();
            program.AdmitPatient(2, 1);
            //program.GetPatients();
            //program.AddDrug();
            //program.GetDrugs();
        }
    }
}
