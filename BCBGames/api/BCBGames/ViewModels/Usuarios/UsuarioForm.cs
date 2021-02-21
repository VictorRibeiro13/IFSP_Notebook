using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;

namespace BCBGames.ViewModels.Usuarios
{
    public class UsuarioForm
    {
        [DisplayName("Nome")] //PRIMEIRO NOME 
        [Required(ErrorMessage = "Este campo é obrigatório")]
        [MaxLength(length: 50, ErrorMessage = "O nome deve ter, no máximo, 50 caracteres")]
        public string Nome { get; set; }

        [DisplayName("E-mail")]
        [Required(ErrorMessage = "Este campo é obrigatório")]
        [EmailAddress(ErrorMessage = "Deve ser um email válido")]
        [MaxLength(length: 50, ErrorMessage = "O nome deve ter, no máximo, 50 caracteres")]
        public string Email { get; set; }

        [DisplayName("Senha")]
        [Required(ErrorMessage = "Este campo é obrigatório.")]
        [MinLength(length: 8, ErrorMessage = "A senha deve conter ao menos 8 caracteres.")]
        public string Senha { get; set; }

        [DisplayName("Confirmar Senha")]
        [Required(ErrorMessage = "Este campo é obrigatório.")]
        [Compare(otherProperty: "Senha", ErrorMessage = "A confirmação de senha deve ser igual a senha.")]
        public string ConfirmarSenha { get; set; }

        [DisplayName("Data de Nascimento")]
        [Required(ErrorMessage = "Este campo é obrigatório")]
        [DataType(DataType.Date)]
        [DisplayFormat(DataFormatString = "{0:MM/dd/yyyy}")]
        public DateTime DataNasc { get; set; }

        [DisplayName("Telefone")]
        [Required(ErrorMessage = "Este campo é obrigatório.")]
        [MinLength(length: 8, ErrorMessage = "O campo deve ter, no mínimo 8 caracteres.")]
        [MaxLength(length: 20, ErrorMessage = "O campo deve ter, no máximo 20 caracteres.")]
        public string Telefone { get; set; }

    }
}