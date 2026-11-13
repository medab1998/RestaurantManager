<%@ include file="../layout/header.jspf" %>
<div class="d-flex justify-content-between align-items-center mb-3">
  <h2 class="page-title"><i class="bi bi-receipt"></i> Commandes</h2>
  <a href="${ctx}/commandes/nouvelle" class="btn btn-accent"><i class="bi bi-plus-lg"></i> Nouvelle commande</a>
</div>
<div class="mb-3">
  <a href="${ctx}/commandes" class="btn btn-sm ${empty filtre ? 'btn-dark' : 'btn-outline-dark'} rounded-pill">Toutes</a>
  <c:forEach items="${statuts}" var="s">
    <a href="${ctx}/commandes?statut=${s}" class="btn btn-sm ${filtre == s ? 'btn-dark' : 'btn-outline-dark'} rounded-pill">${s.label}</a>
  </c:forEach>
</div>
<div class="card p-3"><div class="table-responsive">
<table class="table table-hover mb-0"><thead><tr><th>#</th><th>Date</th><th>Client</th><th>Plat</th><th>Qté</th><th>Total</th><th>Statut</th><th class="text-end">Actions</th></tr></thead><tbody>
<c:forEach items="${commandes}" var="c"><tr>
  <td>${c.id}</td><td>${c.dateFormatee}</td><td>${c.client.nomComplet}</td><td>${c.plat.nom}</td><td>${c.quantite}</td>
  <td class="price"><fmt:formatNumber value="${c.total}" minFractionDigits="3"/> DT</td>
  <td><span class="badge ${c.statut.badge}">${c.statut.label}</span></td>
  <td class="text-end">
    <a href="${ctx}/commandes/${c.id}" class="btn btn-sm btn-outline-primary"><i class="bi bi-eye"></i></a>
    <form action="${ctx}/commandes/supprimer/${c.id}" method="post" class="d-inline" onsubmit="return confirm('Supprimer cette commande ?')">
      <button class="btn btn-sm btn-outline-danger"><i class="bi bi-trash"></i></button></form>
  </td></tr></c:forEach>
<c:if test="${empty commandes}"><tr><td colspan="8" class="text-center text-muted py-4">Aucune commande</td></tr></c:if>
</tbody></table></div></div>
<%@ include file="../layout/footer.jspf" %>
