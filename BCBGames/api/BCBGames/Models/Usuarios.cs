
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace BCBGames.Models
{
    [Table(name: "Usuario")]
    public class Usuarios
    {
        public int usuarioID { get; private set; }
        public string nome { get; private set; }
        public string email { get; private set; }
        public string senha { get; private set; }
        public DateTime dataNascimento { get; private set; }
        public bool ativo { get; private set; }
        public string telefone { get; private set; }
        public Double nota { get; private set; }

        public ICollection<Local> Locais { get; private set; }

        public Usuarios()
        {
        }

        public override bool Equals(object obj)
        {
            var that = obj as Usuarios;
            return that != null && (this.usuarioID == that.usuarioID) && this.nome == that.nome;
        }

        public override int GetHashCode()
        {
            var hashCode = -1643562096;
            hashCode = hashCode * -1521134295 + this.usuarioID.GetHashCode();
            hashCode = hashCode * -1521134295 + EqualityComparer<string>.Default.GetHashCode(nome);
            return hashCode;
        }

        public void Inativar()
        {
            this.ativo = false;
        }

        public static Usuarios Create(int id,string nome, string email, string senha, DateTime dataNascimento, bool ativo, string telefone)
        {
            var novoUsuario = new Usuarios
            {
                usuarioID = id,
                nome = nome,
                email = email,
                senha = senha,
                dataNascimento = dataNascimento,
                ativo = true,
                telefone = telefone,
            };

            return novoUsuario;
        }
    }

    public struct UsuarioID
    {
        public int Valor { get; }
        public UsuarioID(int valor)
        {
            this.Valor = valor;
        }

        public override bool Equals(object obj)
        {
            if (obj != null && obj.GetType() == this.GetType())
                return ((UsuarioID)obj).Valor == this.Valor;
            else
                return false;
        }

        public override int GetHashCode()
        {
            return 991088425 + Valor.GetHashCode();
        }

        public override string ToString()
        {
            return $"UsuarioID({this.Valor})";
        }
    }
}