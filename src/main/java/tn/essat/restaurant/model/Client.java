package tn.essat.restaurant.model;

import jakarta.persistence.*;

@Entity
public class Client {
    @Id @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    private String nom, prenom, telephone, email, adresse;

    public Long getId() { return id; }              public void setId(Long id) { this.id = id; }
    public String getNom() { return nom; }          public void setNom(String nom) { this.nom = nom; }
    public String getPrenom() { return prenom; }    public void setPrenom(String p) { this.prenom = p; }
    public String getTelephone() { return telephone; } public void setTelephone(String t) { this.telephone = t; }
    public String getEmail() { return email; }      public void setEmail(String e) { this.email = e; }
    public String getAdresse() { return adresse; }  public void setAdresse(String a) { this.adresse = a; }
    public String getNomComplet() { return prenom + " " + nom; }
}
