package tn.essat.restaurant.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import tn.essat.restaurant.dao.*;
import tn.essat.restaurant.model.StatutCommande;

@Controller
public class HomeController {
    private final ClientRepository clients; private final PlatRepository plats; private final CommandeRepository commandes;
    public HomeController(ClientRepository c, PlatRepository p, CommandeRepository cm) { clients = c; plats = p; commandes = cm; }

    @ModelAttribute("active") String active() { return "home"; }

    @GetMapping("/")
    public String dashboard(Model m) {
        m.addAttribute("nbClients", clients.count());
        m.addAttribute("nbPlats", plats.count());
        m.addAttribute("nbAttente", commandes.countByStatut(StatutCommande.EN_ATTENTE));
        m.addAttribute("nbPrep", commandes.countByStatut(StatutCommande.EN_PREPARATION));
        m.addAttribute("nbLivrees", commandes.countByStatut(StatutCommande.LIVREE));
        m.addAttribute("nbAnnulees", commandes.countByStatut(StatutCommande.ANNULEE));
        m.addAttribute("recentes", commandes.findAllByOrderByDateCommandeDesc().stream().limit(5).toList());
        return "dashboard";
    }

    @GetMapping("/menu")
    public String menu(Model m) {
        m.addAttribute("active", "menu");
        m.addAttribute("plats", plats.findByDisponibleTrue());
        return "menu";
    }
}
