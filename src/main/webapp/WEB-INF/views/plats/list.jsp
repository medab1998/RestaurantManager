<%@ include file="../layout/header.jspf" %>
<div class="d-flex justify-content-between align-items-center mb-3">
  <h2 class="page-title"><i class="bi bi-cup-hot"></i> Plats</h2>
  <a href="${ctx}/plats/nouveau" class="btn btn-accent"><i class="bi bi-plus-lg"></i> Nouveau plat</a>
</div>
<div class="card p-3"><div class="table-responsive">
<table class="table table-hover mb-0"><thead><tr><th>#</th><th>Nom</th><th>Catégorie</th><th>Prix</th><th>Disponibilité</th><th class="text-end">Actions</th></tr></thead><tbody>
<c:forEach items="${plats}" var="p"><tr>
  <td>${p.id}</td><td><strong>${p.nom}</strong><br><small class="text-muted">${p.description}</small></td>
  <td><span class="badge bg-secondary">${p.categorie}</span></td>
  <td class="price"><fmt:formatNumber value="${p.prix}" minFractionDigits="3"/> DT</td>
  <td><span class="badge ${p.disponible ? 'bg-success' : 'bg-danger'}">${p.disponible ? 'Disponible' : 'Indisponible'}</span></td>
  <td class="text-end">
    <a href="${ctx}/plats/modifier/${p.id}" class="btn btn-sm btn-outline-primary"><i class="bi bi-pencil"></i></a>
    <form action="${ctx}/plats/supprimer/${p.id}" method="post" class="d-inline" onsubmit="return confirm('Supprimer ce plat ?')">
      <button class="btn btn-sm btn-outline-danger"><i class="bi bi-trash"></i></button></form>
  </td></tr></c:forEach>
<c:if test="${empty plats}"><tr><td colspan="6" class="text-center text-muted py-4">Aucun plat</td></tr></c:if>
</tbody></table></div></div>
<%@ include file="../layout/footer.jspf" %>
