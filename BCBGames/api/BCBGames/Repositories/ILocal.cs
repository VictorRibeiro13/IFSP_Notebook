using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using BCBGames.Models;

namespace BCBGames.Repositories
{
    interface ILocal
    {
        Local ObterLocal(int id);
        void Salvar(Local local);
    }
}