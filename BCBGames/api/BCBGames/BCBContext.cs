namespace BCBGames
{
    using BCBGames.Models;
    using System;
    using System.Data.Entity;
    using System.Linq;

    public class BCBContext : DbContext
    {

        public DbSet<Usuarios> Usuarios { get; set; }
        public DbSet<Jogos> Jogos { get; set; }
        public DbSet<Local> Local { get; set; }
        public DbSet<Plataformas> Plataformas { get; set; }

    }

    //public class MyEntity
    //{
    //    public int Id { get; set; }
    //    public string Name { get; set; }
    //}
}