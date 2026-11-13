<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ include file="../layout/header.jspf" %>
<h2 class="page-title mb-3"><i class="bi bi-cup-hot"></i> ${plat.id == null ? 'Nouveau plat' : 'Modifier le plat'}</h2>
<div class="card p-4"><form:form modelAttribute="plat" action="${ctx}/plats/enregistrer" method="post">
  <form:hidden path="id"/>
  <div class="row g-3">
    <div class="col-md-6"><label class="form-label">Nom</label><form:input path="nom" cssClass="form-control" required="required"/></div>
    <div class="col-md-3"><label class="form-label">Catégorie</label><form:input path="categorie" cssClass="form-control" placeholder="Entrée, Plat, Dessert..."/></div>
    <div class="col-md-3"><label class="form-label">Prix (DT)</label><form:input path="prix" type="number" step="0.001" min="0" cssClass="form-control" required="required"/></div>
    <div class="col-12"><label class="form-label">Description</label><form:textarea path="description" rows="3" cssClass="form-control"/></div>
    <div class="col-12"><div class="form-check form-switch"><form:checkbox path="disponible" cssClass="form-check-input"/><label class="form-check-label">Disponible</label></div></div>
  </div>
  <div class="mt-4"><button class="btn btn-accent"><i class="bi bi-save"></i> Enregistrer</button>
  <a href="${ctx}/plats" class="btn btn-light">Annuler</a></div>
</form:form></div>
<%@ include file="../layout/footer.jspf" %>
