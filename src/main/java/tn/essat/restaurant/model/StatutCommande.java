package tn.essat.restaurant.model;

public enum StatutCommande {
    EN_ATTENTE("En attente", "bg-warning text-dark"),
    EN_PREPARATION("En préparation", "bg-info text-dark"),
    LIVREE("Livrée", "bg-success"),
    ANNULEE("Annulée", "bg-danger");

    private final String label, badge;
    StatutCommande(String label, String badge) { this.label = label; this.badge = badge; }
    public String getLabel() { return label; }
    public String getBadge() { return badge; }
}
