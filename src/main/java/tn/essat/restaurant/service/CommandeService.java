package tn.essat.restaurant.service;

import java.time.LocalDateTime;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import tn.essat.restaurant.dao.*;
import tn.essat.restaurant.model.*;

@Service
public class CommandeService {
    private final CommandeRepository commandes;
    private final ClientRepository clients;
    private final PlatRepository plats;

    public CommandeService(CommandeRepository c, ClientRepository cl, PlatRepository p) {
        this.commandes = c; this.clients = cl; this.plats = p;
    }

    @Transactional
    public Commande passerCommande(Long clientId, Long platId, int quantite) {
        Client client = clients.findById(clientId).orElseThrow(() -> new IllegalArgumentException("Client introuvable"));
        Plat plat = plats.findById(platId).orElseThrow(() -> new IllegalArgumentException("Plat introuvable"));
        if (!plat.isDisponible()) throw new IllegalStateException("Ce plat n'est plus disponible");
        if (quantite < 1) throw new IllegalArgumentException("Quantité invalide");
        Commande c = new Commande();
        c.setClient(client); c.setPlat(plat); c.setQuantite(quantite);
        c.setDateCommande(LocalDateTime.now());
        c.setStatut(StatutCommande.EN_ATTENTE);
        return commandes.save(c);
    }

    @Transactional
    public void changerStatut(Long id, StatutCommande statut) {
        Commande c = commandes.findById(id).orElseThrow();
        c.setStatut(statut);
    }
}
