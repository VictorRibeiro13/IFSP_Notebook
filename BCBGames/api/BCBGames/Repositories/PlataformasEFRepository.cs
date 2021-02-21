using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using BCBGames.Models;

namespace BCBGames.Repositories
{
    public class PlataformasEFRepository : IPlataformas
    {
        private static int ultimoID = 0;

        public Plataformas ObterPlataforma(int id)
        {
            using (var db = new BCBContext())
            {
                var plataforma = db.Plataformas.SingleOrDefault(q => q.plataformaID == id);

                return plataforma;
            }
        }

        public void Salvar(Plataformas plataforma)
        {
            using (var ctx = new BCBContext())
            {
                using (var db = new BCBContext())
                {
                    db.Plataformas.Add(plataforma);
                    db.SaveChanges();
                }
            }
        }
    }
}