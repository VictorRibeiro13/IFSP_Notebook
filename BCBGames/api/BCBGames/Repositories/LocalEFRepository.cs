using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using BCBGames.Models;

namespace BCBGames.Repositories
{
    public class LocalEFRepository : ILocal
    {
        private static int ultimoID = 0;

        public Local ObterLocal(int id)
        {
            using (var db = new BCBContext())
            {
                var local = db.Local.SingleOrDefault(q => q.localID == id);

                return local;
            }
        }

        public void Salvar(Local local)
        {
            using (var ctx = new BCBContext())
            {
                using (var db = new BCBContext())
                {
                    db.Local.Add(local);
                    db.SaveChanges();
                }
            }
        }
    }
}