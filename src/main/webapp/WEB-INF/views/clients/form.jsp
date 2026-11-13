<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ include file="../layout/header.jspf" %>
<h2 class="page-title mb-3"><i class="bi bi-person-plus"></i> ${client.id == null ? 'Nouveau client' : 'Modifier le client'}</h2>
<div class="card p-4"><form:form modelAttribute="client" action="${ctx}/clients/enregistrer" method="post">
  <form:hidden path="id"/>
  <div class="row g-3">
    <div class="col-md-6"><label class="form-label">Nom</label><form:input path="nom" cssClass="form-control" required="required"/></div>
    <div class="col-md-6"><label class="form-label">Prénom</label><form:input path="prenom" cssClass="form-control" required="required"/></div>
    <div class="col-md-6"><label class="form-label">Téléphone</label><form:input path="telephone" cssClass="form-control"/></div>
    <div class="col-md-6"><label class="form-label">Email</label><form:input path="email" type="email" cssClass="form-control"/></div>
    <div class="col-12"><label class="form-label">Adresse</label><form:input path="adresse" cssClass="form-control"/></div>
  </div>
  <div class="mt-4"><button class="btn btn-accent"><i class="bi bi-save"></i> Enregistrer</button>
  <a href="${ctx}/clients" class="btn btn-light">Annuler</a></div>
</form:form></div>
<%@ include file="../layout/footer.jspf" %>
