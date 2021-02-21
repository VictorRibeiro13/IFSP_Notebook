using BCBGames.ViewModels.Usuarios;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using BCBGames.Repositories;
using BCBGames.ViewModels.Usuarios;
using BCBGames.Services;
using BCBGames.Models;

namespace BCBGames.Controllers
{
    public class UsuariosController : Controller
    {
        private IUsuariosService usuariosService;


        public UsuariosController() {
            this.usuariosService = new UsuariosService();
        }

        // GET: Usuarios
        public ActionResult List()
        {
            var Usuarios = usuariosService.ObterUsuarios();
            return View(Usuarios);
        }

        // GET: Usuarios/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: Usuarios/Create
        [HttpPost]
        public ActionResult Create(UsuarioForm form)
        {

            if (ModelState.IsValid)
            {
                usuariosService.CriarUsuario(form.Nome, form.Email, form.Senha, form.DataNasc, form.Telefone);
                TempData["MensagemSucesso"] = "Usuario criado!";
                return RedirectToAction("List");
            }
            else {
                return View(form);
               
            }       
          
        }

        // GET: Usuarios/Edit/5
        public ActionResult Edit(int id)
        {
            return View();
        }

        // POST: Usuarios/Edit/5
        [HttpPost]
        public ActionResult Edit(int id, FormCollection collection)
        {
            try
            {
                // TODO: Add update logic here

                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }

        // GET: Usuarios/Delete/5
        public ActionResult Delete(int id)
        {
            usuariosService.ExcluirUsuario(new Usuarios(id));

            TempData["Mensagem"] = "Quadro removido.";

            return RedirectToAction("list");
        }

    }
}
