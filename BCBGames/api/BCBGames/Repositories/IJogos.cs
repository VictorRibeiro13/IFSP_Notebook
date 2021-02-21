using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using BCBGames.Models;

namespace BCBGames.Repositories
{
    interface IJogos
    {
        Jogos ObterJogo(int id);
        void Salvar(Jogos jogo);
        void Inativar(int id);
    }
}