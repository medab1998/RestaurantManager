<%@ include file="layout/header.jspf" %>
<div class="hero mb-4">
  <h1>Bienvenue chez RestaurantManager</h1>
  <p class="mb-0">Gérez vos clients, votre menu et vos commandes en un clic.</p>
</div>
<h2 class="page-title mb-4"><i class="bi bi-speedometer2"></i> Tableau de bord</h2>
<div class="row g-3 mb-4">
  <div class="col-6 col-lg-3"><div class="stat-card bg-g1 d-flex justify-content-between align-items-center"><div><small>Clients</small><h2>${nbClients}</h2></div><i class="bi bi-people"></i></div></div>
  <div class="col-6 col-lg-3"><div class="stat-card bg-g2 d-flex justify-content-between align-items-center"><div><small>Plats</small><h2>${nbPlats}</h2></div><i class="bi bi-cup-hot"></i></div></div>
  <div class="col-6 col-lg-3"><div class="stat-card bg-g3 d-flex justify-content-between align-items-center"><div><small>En attente</small><h2>${nbAttente}</h2></div><i class="bi bi-hourglass-split"></i></div></div>
  <div class="col-6 col-lg-3"><div class="stat-card bg-g4 d-flex justify-content-between align-items-center"><div><small>Livrées</small><h2>${nbLivrees}</h2></div><i class="bi bi-check2-circle"></i></div></div>
</div>
<div class="card p-3">
  <div class="d-flex justify-content-between mb-2"><h5 class="mb-0">Dernières commandes</h5>
    <a href="${ctx}/commandes/nouvelle" class="btn btn-accent btn-sm"><i class="bi bi-plus-lg"></i> Nouvelle commande</a></div>
  <table class="table table-hover mb-0"><thead><tr><th>#</th><th>Client</th><th>Plat</th><th>Total</th><th>Statut</th></tr></thead><tbody>
  <c:forEach items="${recentes}" var="c"><tr>
    <td><a href="${ctx}/commandes/${c.id}">${c.id}</a></td><td>${c.client.nomComplet}</td><td>${c.plat.nom} × ${c.quantite}</td>
    <td><fmt:formatNumber value="${c.total}" minFractionDigits="3"/> DT</td>
    <td><span class="badge ${c.statut.badge}">${c.statut.label}</span></td></tr></c:forEach>
  <c:if test="${empty recentes}"><tr><td colspan="5" class="text-center text-muted py-4">Aucune commande pour le moment</td></tr></c:if>
  </tbody></table>
</div>
<%@ include file="layout/footer.jspf" %>
