<%@ include file="../layout/header.jspf" %>
<h2 class="page-title mb-3"><i class="bi bi-cart-plus"></i> Nouvelle commande</h2>
<div class="card p-4"><form action="${ctx}/commandes/enregistrer" method="post">
  <div class="row g-3">
    <div class="col-md-5"><label class="form-label">Client</label>
      <select name="clientId" class="form-select" required>
        <option value="">-- Choisir --</option>
        <c:forEach items="${clients}" var="c"><option value="${c.id}">${c.nomComplet}</option></c:forEach>
      </select></div>
    <div class="col-md-5"><label class="form-label">Plat</label>
      <select name="platId" class="form-select" required>
        <option value="">-- Choisir --</option>
        <c:forEach items="${plats}" var="p"><option value="${p.id}" ${p.id == platId ? 'selected' : ''}>${p.nom} — <fmt:formatNumber value="${p.prix}" minFractionDigits="3"/> DT</option></c:forEach>
      </select></div>
    <div class="col-md-2"><label class="form-label">Quantité</label><input type="number" name="quantite" min="1" value="1" class="form-control" required></div>
  </div>
  <div class="mt-4"><button class="btn btn-accent"><i class="bi bi-check2"></i> Valider la commande</button>
  <a href="${ctx}/commandes" class="btn btn-light">Annuler</a></div>
</form></div>
<%@ include file="../layout/footer.jspf" %>
