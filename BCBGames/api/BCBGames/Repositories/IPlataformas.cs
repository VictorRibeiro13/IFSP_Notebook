using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using BCBGames.Models;

namespace BCBGames.Repositories
{
    interface IPlataformas
    {
        Plataformas ObterPlataforma(int id);
        void Salvar(Plataformas plataforma);
    }
}