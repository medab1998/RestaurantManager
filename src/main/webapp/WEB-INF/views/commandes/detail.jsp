<%@ include file="../layout/header.jspf" %>
<h2 class="page-title mb-3"><i class="bi bi-receipt"></i> Commande n° ${commande.id}</h2>
<div class="row g-4">
  <div class="col-lg-7"><div class="card p-4">
    <table class="table table-borderless mb-0">
      <tr><th>Date</th><td>${commande.dateFormatee}</td></tr>
      <tr><th>Client</th><td>${commande.client.nomComplet} <small class="text-muted">(${commande.client.telephone})</small></td></tr>
      <tr><th>Plat</th><td>${commande.plat.nom} <small class="text-muted">— ${commande.plat.categorie}</small></td></tr>
      <tr><th>Prix unitaire</th><td><fmt:formatNumber value="${commande.plat.prix}" minFractionDigits="3"/> DT</td></tr>
      <tr><th>Quantité</th><td>${commande.quantite}</td></tr>
      <tr><th>Total</th><td class="price"><fmt:formatNumber value="${commande.total}" minFractionDigits="3"/> DT</td></tr>
      <tr><th>Statut</th><td><span class="badge ${commande.statut.badge}">${commande.statut.label}</span></td></tr>
    </table></div></div>
  <div class="col-lg-5"><div class="card p-4">
    <h5 class="mb-3">Modifier l'état</h5>
    <form action="${ctx}/commandes/${commande.id}/statut" method="post">
      <select name="statut" class="form-select mb-3">
        <c:forEach items="${statuts}" var="s"><option value="${s}" ${commande.statut == s ? 'selected' : ''}>${s.label}</option></c:forEach>
      </select>
      <button class="btn btn-accent w-100"><i class="bi bi-arrow-repeat"></i> Mettre à jour</button>
    </form>
    <a href="${ctx}/commandes" class="btn btn-light w-100 mt-2"><i class="bi bi-arrow-left"></i> Retour</a>
  </div></div>
</div>
<%@ include file="../layout/footer.jspf" %>
