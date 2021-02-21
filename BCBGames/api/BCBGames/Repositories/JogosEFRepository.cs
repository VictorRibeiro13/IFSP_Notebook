using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using BCBGames.Models;

namespace BCBGames.Repositories
{
    public class JogosEFRepository : IJogos
    {
        private static int ultimoID = 0;

        public Jogos ObterJogo(int id)
        {
            using (var db = new BCBContext())
            {
                var jogo = db.Jogos.SingleOrDefault(q => q.jogoID == id);

                return jogo;
            }
        }

        public void Salvar(Jogos jogo)
        {
            using (var ctx = new BCBContext())
            {
                using (var db = new BCBContext())
                {
                    db.Jogos.Add(jogo);
                    db.SaveChanges();
                }
            }
        }

        public void Inativar(int id)
        {
            using (var db = new BCBContext())
            {
                var jogoAInativar = db.Jogos.SingleOrDefault(jogo => jogo.jogoID == id);

                if (jogoAInativar != null)
                {
                    jogoAInativar.Inativar();
                    db.SaveChanges();
                }
                else
                    throw new ArgumentException($"O elemento com ID {id} não existe");
            }
        }
    }
}