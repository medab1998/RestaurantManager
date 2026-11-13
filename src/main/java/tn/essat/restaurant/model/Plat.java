package tn.essat.restaurant.model;

import jakarta.persistence.*;

@Entity
public class Plat {
    @Id @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    private String nom, categorie;
    @Column(length = 500) private String description;
    private double prix;
    private boolean disponible = true;

    public Long getId() { return id; }                 public void setId(Long id) { this.id = id; }
    public String getNom() { return nom; }             public void setNom(String n) { this.nom = n; }
    public String getCategorie() { return categorie; } public void setCategorie(String c) { this.categorie = c; }
    public String getDescription() { return description; } public void setDescription(String d) { this.description = d; }
    public double getPrix() { return prix; }           public void setPrix(double p) { this.prix = p; }
    public boolean isDisponible() { return disponible; } public void setDisponible(boolean d) { this.disponible = d; }
}
