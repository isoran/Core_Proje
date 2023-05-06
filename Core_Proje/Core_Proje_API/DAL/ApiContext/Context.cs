using Core_Proje_API.DAL.Entity;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Core_Proje_API.DAL.ApiContext
{
    public class Context:DbContext
    {
        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
            optionsBuilder.UseSqlServer("server=DESKTOP-394B550\\SQLEXPRESS;database=CoreProjeDB_API;integrated security=true; ");
        }

        public DbSet<Category> Categories { get; set; }
    }
}
