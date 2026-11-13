package tn.essat.restaurant.controller;

import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import tn.essat.restaurant.dao.ClientRepository;
import tn.essat.restaurant.model.Client;

@Controller
@RequestMapping("/clients")
public class ClientController {
    private final ClientRepository repo;
    public ClientController(ClientRepository repo) { this.repo = repo; }

    @ModelAttribute("active") String active() { return "clients"; }

    @GetMapping
    public String liste(Model m) { m.addAttribute("clients", repo.findAll()); return "clients/list"; }

    @GetMapping("/nouveau")
    public String nouveau(Model m) { m.addAttribute("client", new Client()); return "clients/form"; }

    @GetMapping("/modifier/{id}")
    public String modifier(@PathVariable Long id, Model m) {
        m.addAttribute("client", repo.findById(id).orElseThrow());
        return "clients/form";
    }

    @PostMapping("/enregistrer")
    public String enregistrer(@ModelAttribute Client client, RedirectAttributes ra) {
        repo.save(client);
        ra.addFlashAttribute("succes", "Client enregistré avec succès.");
        return "redirect:/clients";
    }

    @PostMapping("/supprimer/{id}")
    public String supprimer(@PathVariable Long id, RedirectAttributes ra) {
        try { repo.deleteById(id); ra.addFlashAttribute("succes", "Client supprimé."); }
        catch (DataIntegrityViolationException e) {
            ra.addFlashAttribute("erreur", "Impossible : ce client a des commandes associées.");
        }
        return "redirect:/clients";
    }
}
