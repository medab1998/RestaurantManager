<%@ include file="../layout/header.jspf" %>
<div class="d-flex justify-content-between align-items-center mb-3">
  <h2 class="page-title"><i class="bi bi-people"></i> Clients</h2>
  <a href="${ctx}/clients/nouveau" class="btn btn-accent"><i class="bi bi-plus-lg"></i> Nouveau client</a>
</div>
<div class="card p-3"><div class="table-responsive">
<table class="table table-hover mb-0"><thead><tr><th>#</th><th>Nom complet</th><th>Téléphone</th><th>Email</th><th>Adresse</th><th class="text-end">Actions</th></tr></thead><tbody>
<c:forEach items="${clients}" var="c"><tr>
  <td>${c.id}</td><td><strong>${c.nomComplet}</strong></td><td>${c.telephone}</td><td>${c.email}</td><td>${c.adresse}</td>
  <td class="text-end">
    <a href="${ctx}/clients/modifier/${c.id}" class="btn btn-sm btn-outline-primary"><i class="bi bi-pencil"></i></a>
    <form action="${ctx}/clients/supprimer/${c.id}" method="post" class="d-inline" onsubmit="return confirm('Supprimer ce client ?')">
      <button class="btn btn-sm btn-outline-danger"><i class="bi bi-trash"></i></button></form>
  </td></tr></c:forEach>
<c:if test="${empty clients}"><tr><td colspan="6" class="text-center text-muted py-4">Aucun client</td></tr></c:if>
</tbody></table></div></div>
<%@ include file="../layout/footer.jspf" %>
