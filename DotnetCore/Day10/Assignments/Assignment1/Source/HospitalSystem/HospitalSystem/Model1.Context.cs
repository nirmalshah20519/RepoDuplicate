﻿//------------------------------------------------------------------------------
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
    using System.Data.Entity;
    using System.Data.Entity.Infrastructure;
    
    public partial class HospitalSystem : DbContext
    {
        public HospitalSystem()
            : base("name=HospitalSystem")
        {
        }
    
        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            throw new UnintentionalCodeFirstException();
        }
    
        public DbSet<ATTENDEE> ATTENDEEs { get; set; }
        public DbSet<DEPARTMENT> DEPARTMENTs { get; set; }
        public DbSet<Drug> Drugs { get; set; }
        public DbSet<HospitalEmployee> HospitalEmployees { get; set; }
        public DbSet<Patient> Patients { get; set; }
        public DbSet<Prescription> Prescriptions { get; set; }
        public DbSet<Attending> Attendings { get; set; }
    }
}
