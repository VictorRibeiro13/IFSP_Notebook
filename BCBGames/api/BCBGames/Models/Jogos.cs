using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace BCBGames.Models
{
    [Table(name:"Jogos")]
    public class Jogos
    {
        public int jogoID { get; private set; }
        public string nome { get; private set; }
        public Int16 ano { get; private set; }
        public bool ativo { get; private set; }


        public Jogos(String n,Int16 an,bool a) {
            nome = n;
            ano = an;
            ativo = a;
        }

        public override bool Equals(object obj)
        {
            var that = obj as Jogos;
            return that != null && (this.jogoID == that.jogoID) && this.nome == that.nome;
        }

        public override int GetHashCode()
        {
            var hashCode = -1643562096;
            hashCode = hashCode * -1521134295 + this.jogoID.GetHashCode();
            hashCode = hashCode * -1521134295 + EqualityComparer<string>.Default.GetHashCode(nome);
            return hashCode;
        }

        public void Inativar()
        {
            this.ativo = false;
        }

    }

    public struct JogoID
    {
        public int Valor { get; }
        public JogoID(int valor)
        {
            this.Valor = valor;
        }

        public override bool Equals(object obj)
        {
            if (obj != null && obj.GetType() == this.GetType())
                return ((JogoID)obj).Valor == this.Valor;
            else
                return false;
        }

        public override int GetHashCode()
        {
            return 991088425 + Valor.GetHashCode();
        }

        public override string ToString()
        {
            return $"JogoID({this.Valor})";
        }
    }
}