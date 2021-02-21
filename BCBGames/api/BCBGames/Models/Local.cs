using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace BCBGames.Models
{
    [Table(name:"Local")]
    public class Local
    {
        public int localID { get; private set; }
        public Double longitude { get; private set; }
        public Double latitude { get; private set; }
        public int usuarioID { get; set; }
  
        public virtual Usuarios Usuario { get; set; }

        public Local(Double longi, Double lat)
        {
            longitude = longi;
            latitude = lat;
        }

        public override bool Equals(object obj)
        {
            var that = obj as Local;
            return that != null && (this.localID == that.localID);
        }

        public override int GetHashCode()
        {
            var hashCode = -1643562096;
            hashCode = hashCode * -1521134295 + this.localID.GetHashCode();
            return hashCode;
        }
    }
}