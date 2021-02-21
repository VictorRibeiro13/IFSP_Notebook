using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using BCBGames.Models;

namespace BCBGames.Services
{
    interface IUsuariosService
    {
        bool ExisteUsuario(string email);
        Usuarios CriarUsuario(string nome, string email, string senha, DateTime dataNascimento, string telefone);
        Usuarios ObterUsuario(string email);
        IEnumerable<Usuarios> ObterUsuarios();
        bool ExcluirUsuario(Usuarios usuario);

    }
}
