package tn.essat.restaurant.model;

import jakarta.persistence.*;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

@Entity
public class Commande {
    @Id @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    @ManyToOne(optional = false) private Client client;
    @ManyToOne(optional = false) private Plat plat;
    private int quantite;
    private LocalDateTime dateCommande = LocalDateTime.now();
    @Enumerated(EnumType.STRING) private StatutCommande statut = StatutCommande.EN_ATTENTE;

    public Long getId() { return id; }                   public void setId(Long id) { this.id = id; }
    public Client getClient() { return client; }         public void setClient(Client c) { this.client = c; }
    public Plat getPlat() { return plat; }               public void setPlat(Plat p) { this.plat = p; }
    public int getQuantite() { return quantite; }        public void setQuantite(int q) { this.quantite = q; }
    public LocalDateTime getDateCommande() { return dateCommande; }
    public void setDateCommande(LocalDateTime d) { this.dateCommande = d; }
    public StatutCommande getStatut() { return statut; } public void setStatut(StatutCommande s) { this.statut = s; }

    public double getTotal() { return plat.getPrix() * quantite; }
    public String getDateFormatee() { return dateCommande.format(DateTimeFormatter.ofPattern("dd/MM/yyyy HH:mm")); }
}
