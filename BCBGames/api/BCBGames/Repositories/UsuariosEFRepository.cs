using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using BCBGames.Models;

namespace BCBGames.Repositories
{
    public class UsuariosEFRepository : IUsuarios
    {
        private static Dictionary<string, Usuarios> DictionaryUsuarios = new Dictionary<string, Usuarios>();
        private static int ultimoID = 0;


        public Usuarios ObterUsuario(string email)
        {
            return DictionaryUsuarios.ContainsKey(email) ? DictionaryUsuarios[email] : null;
        }

        public Usuarios CriarUsuario(Usuarios usuario)
        {
            if (!DictionaryUsuarios.ContainsKey(usuario.email))
                DictionaryUsuarios.Add(usuario.email, usuario);
            else
                throw new ArgumentException($"Já existe um usuario com o e-mail {usuario.email}");
            return usuario;
        }

        public void Inativar(int id)
        {
            using (var db = new BCBContext())
            {
                var usuarioAInativar = db.Usuarios.SingleOrDefault(usuario => usuario.usuarioID == id);

                if (usuarioAInativar != null)
                {
                    usuarioAInativar.Inativar();
                    db.SaveChanges();
                }
                else
                    throw new ArgumentException($"O elemento com ID {id} não existe");
            }
        }

        public IEnumerable<Usuarios> ObterTodos() {
            using (var db = new BCBContext()) {
                var result = db.Usuarios.OrderBy(quadro => quadro.nome);
                return result.ToList();
            }                
        }

        public int ProximoID(){ return ++ultimoID; }

        public void Salvar(Usuarios usuario)
        {
            using (var db = new BCBContext()) {
                db.Usuarios.Add(usuario);
                db.SaveChanges();
            }
        }

        public bool Excluir(int id) {

            using (var db = new BCBContext()) {

                var userDelete = db.Usuarios.SingleOrDefault(usuario => usuario.usuarioID == id);

                if (userDelete != null) {
                    db.Usuarios.Remove(userDelete);
                    return (db.SaveChanges() > 0); // retorna o valor 1 , se SaveChenges() for existo , ou seja true.                       
                }
                else
                    throw new ArgumentException($"O elemento com ID {id} não existe");
            }              
        }


    }
}