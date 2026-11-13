package tn.essat.restaurant.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import tn.essat.restaurant.dao.*;
import tn.essat.restaurant.model.StatutCommande;
import tn.essat.restaurant.service.CommandeService;

@Controller
@RequestMapping("/commandes")
public class CommandeController {
    private final CommandeRepository commandes; private final ClientRepository clients;
    private final PlatRepository plats; private final CommandeService service;

    public CommandeController(CommandeRepository c, ClientRepository cl, PlatRepository p, CommandeService s) {
        commandes = c; clients = cl; plats = p; service = s;
    }

    @ModelAttribute("active") String active() { return "commandes"; }

    @GetMapping
    public String liste(@RequestParam(required = false) StatutCommande statut, Model m) {
        m.addAttribute("commandes", statut == null
                ? commandes.findAllByOrderByDateCommandeDesc()
                : commandes.findByStatutOrderByDateCommandeDesc(statut));
        m.addAttribute("statuts", StatutCommande.values());
        m.addAttribute("filtre", statut);
        return "commandes/list";
    }

    @GetMapping("/nouvelle")
    public String nouvelle(@RequestParam(required = false) Long platId, Model m) {
        m.addAttribute("clients", clients.findAll());
        m.addAttribute("plats", plats.findByDisponibleTrue());
        m.addAttribute("platId", platId);
        return "commandes/form";
    }

    @PostMapping("/enregistrer")
    public String enregistrer(@RequestParam Long clientId, @RequestParam Long platId,
                              @RequestParam int quantite, RedirectAttributes ra) {
        try {
            service.passerCommande(clientId, platId, quantite);
            ra.addFlashAttribute("succes", "Commande passée avec succès.");
        } catch (RuntimeException e) {
            ra.addFlashAttribute("erreur", e.getMessage());
        }
        return "redirect:/commandes";
    }

    @GetMapping("/{id}")
    public String detail(@PathVariable Long id, Model m) {
        m.addAttribute("commande", commandes.findById(id).orElseThrow());
        m.addAttribute("statuts", StatutCommande.values());
        return "commandes/detail";
    }

    @PostMapping("/{id}/statut")
    public String statut(@PathVariable Long id, @RequestParam StatutCommande statut, RedirectAttributes ra) {
        service.changerStatut(id, statut);
        ra.addFlashAttribute("succes", "Statut mis à jour : " + statut.getLabel());
        return "redirect:/commandes/" + id;
    }

    @PostMapping("/supprimer/{id}")
    public String supprimer(@PathVariable Long id, RedirectAttributes ra) {
        commandes.deleteById(id);
        ra.addFlashAttribute("succes", "Commande supprimée.");
        return "redirect:/commandes";
    }
}
