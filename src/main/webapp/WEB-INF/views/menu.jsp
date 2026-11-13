<%@ include file="layout/header.jspf" %>
<div class="hero mb-4">
  <h1><i class="bi bi-book"></i> Notre menu</h1>
  <p class="mb-0">Choisissez vos plats préférés et passez commande.</p>
</div>
<div class="row g-4">
<c:forEach items="${plats}" var="p">
  <div class="col-md-6 col-lg-4"><div class="card plat-card h-100">
    <div class="plat-icon"><i class="bi bi-egg-fried"></i></div>
    <div class="card-body d-flex flex-column">
      <span class="badge bg-secondary align-self-start mb-2">${p.categorie}</span>
      <h5>${p.nom}</h5><p class="text-muted small flex-grow-1">${p.description}</p>
      <div class="d-flex justify-content-between align-items-center">
        <span class="price"><fmt:formatNumber value="${p.prix}" minFractionDigits="3"/> DT</span>
        <a href="${ctx}/commandes/nouvelle?platId=${p.id}" class="btn btn-accent btn-sm"><i class="bi bi-cart-plus"></i> Commander</a>
      </div></div></div></div>
</c:forEach>
<c:if test="${empty plats}"><p class="text-muted">Le menu est vide pour le moment.</p></c:if>
</div>
<%@ include file="layout/footer.jspf" %>
