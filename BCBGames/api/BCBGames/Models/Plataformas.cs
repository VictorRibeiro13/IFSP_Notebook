using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace BCBGames.Models
{
    [Table(name: "Plataforma")]
    public class Plataformas
    {
        public int plataformaID { get; private set; }
        public string nome { get; private set; }

        public Plataformas(string n)
        {
            nome = n;
        }

        public override bool Equals(object obj)
        {
            var that = obj as Plataformas;
            return that != null && (this.plataformaID == that.plataformaID) && this.nome == that.nome;
        }

        public override int GetHashCode()
        {
            var hashCode = -1643562096;
            hashCode = hashCode * -1521134295 + this.plataformaID.GetHashCode();
            hashCode = hashCode * -1521134295 + EqualityComparer<string>.Default.GetHashCode(nome);
            return hashCode;
        }

    }

    public struct PlataformaID
    {
        public int Valor { get; }
        public PlataformaID(int valor)
        {
            this.Valor = valor;
        }

        public override bool Equals(object obj)
        {
            if (obj != null && obj.GetType() == this.GetType())
                return ((PlataformaID)obj).Valor == this.Valor;
            else
                return false;
        }

        public override int GetHashCode()
        {
            return 991088425 + Valor.GetHashCode();
        }

        public override string ToString()
        {
            return $"PlataformaID({this.Valor})";
        }
    }

}