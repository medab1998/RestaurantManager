package tn.essat.restaurant.dao;

import java.util.List;
import org.springframework.data.jpa.repository.JpaRepository;
import tn.essat.restaurant.model.*;

public interface CommandeRepository extends JpaRepository<Commande, Long> {
    List<Commande> findAllByOrderByDateCommandeDesc();
    List<Commande> findByStatutOrderByDateCommandeDesc(StatutCommande statut);
    long countByStatut(StatutCommande statut);
}
