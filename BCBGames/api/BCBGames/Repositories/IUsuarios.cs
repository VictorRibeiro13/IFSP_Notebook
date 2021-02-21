using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using BCBGames.Models;

namespace BCBGames.Repositories
{
    interface IUsuarios
    {
        Usuarios ObterUsuario(string email);
        Usuarios CriarUsuario(Usuarios usuario);
        void Inativar(int id);
        IEnumerable<Usuarios> ObterTodos();
        int ProximoID();
        void Salvar(Usuarios usuario);
        bool Excluir(int id);
    }
}
