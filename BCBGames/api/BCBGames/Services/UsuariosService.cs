using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using BCBGames.Models;
using BCBGames.Repositories;

namespace BCBGames.Services
{
    internal class UsuariosService : IUsuariosService
    {
        private UsuariosEFRepository _repository;

        public UsuariosService()
        {
            this._repository = new UsuariosEFRepository();
        }

        public bool ExisteUsuario(string email) => _repository.ObterUsuario(email) != null;

        public Usuarios ObterUsuario(string email) => _repository.ObterUsuario(email);

        public Usuarios CriarUsuario(string nome, string email, string senha, DateTime dataNascimento, string telefone)
        {
            if (_repository.ObterUsuario(email) == null)
            {
                var id = _repository.ProximoID();
                var novoUsuario = Usuarios.Create(id, nome, email, senha, dataNascimento, true, telefone);
                return _repository.CriarUsuario(novoUsuario);
            }
            else
            {
                throw new ArgumentException("Já existe um usuário com este e-mail.");
            }
        }

        public IEnumerable<Usuarios> ObterUsuarios() {
            return _repository.ObterTodos();
        }

        public bool ExcluirUsuario(Usuarios usuario) {
             return _repository.Excluir(usuario.usuarioID);
        }

    }
}