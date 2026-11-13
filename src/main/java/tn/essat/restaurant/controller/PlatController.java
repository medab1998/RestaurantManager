package tn.essat.restaurant.controller;

import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import tn.essat.restaurant.dao.PlatRepository;
import tn.essat.restaurant.model.Plat;

@Controller
@RequestMapping("/plats")
public class PlatController {
    private final PlatRepository repo;
    public PlatController(PlatRepository repo) { this.repo = repo; }

    @ModelAttribute("active") String active() { return "plats"; }

    @GetMapping
    public String liste(Model m) { m.addAttribute("plats", repo.findAll()); return "plats/list"; }

    @GetMapping("/nouveau")
    public String nouveau(Model m) { m.addAttribute("plat", new Plat()); return "plats/form"; }

    @GetMapping("/modifier/{id}")
    public String modifier(@PathVariable Long id, Model m) {
        m.addAttribute("plat", repo.findById(id).orElseThrow());
        return "plats/form";
    }

    @PostMapping("/enregistrer")
    public String enregistrer(@ModelAttribute Plat plat, RedirectAttributes ra) {
        repo.save(plat);
        ra.addFlashAttribute("succes", "Plat enregistré avec succès.");
        return "redirect:/plats";
    }

    @PostMapping("/supprimer/{id}")
    public String supprimer(@PathVariable Long id, RedirectAttributes ra) {
        try { repo.deleteById(id); ra.addFlashAttribute("succes", "Plat supprimé."); }
        catch (DataIntegrityViolationException e) {
            ra.addFlashAttribute("erreur", "Impossible : ce plat figure dans des commandes.");
        }
        return "redirect:/plats";
    }
}
