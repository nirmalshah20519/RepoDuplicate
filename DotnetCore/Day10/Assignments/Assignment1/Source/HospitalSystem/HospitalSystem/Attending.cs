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
    
    public partial class Attending
    {
        public int PatientID { get; set; }
        public int AttendeeID { get; set; }
        public int AttendeeTypeID { get; set; }
    
        public virtual ATTENDEE ATTENDEE { get; set; }
        public virtual Patient Patient { get; set; }
    }
}
