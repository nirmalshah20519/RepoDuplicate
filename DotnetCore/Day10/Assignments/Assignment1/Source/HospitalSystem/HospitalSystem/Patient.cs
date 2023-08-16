//------------------------------------------------------------------------------
// <auto-generated>
//    This code was generated from a template.
//
//    Manual changes to this file may cause unexpected behavior in your application.
//    Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace HospitalSystem
{
    using System;
    using System.Collections.Generic;
    
    public partial class Patient
    {
        public Patient()
        {
            this.Attendings = new HashSet<Attending>();
        }
    
        public int PatientID { get; set; }
        public string PatientName { get; set; }
        public Nullable<int> DeptID { get; set; }
        public System.DateTime DOB { get; set; }
        public int Height_in_cms_ { get; set; }
        public int Weight_in_kg_ { get; set; }
    
        public virtual DEPARTMENT DEPARTMENT { get; set; }
        public virtual ICollection<Attending> Attendings { get; set; }
    }
}
