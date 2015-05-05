
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8" />
        <title>Test</title>
    </head> 

<body>

<%-- Inclusion du menu   --%>
<h1>Inclusion Menu</h1>
<%@ include file="menu.jsp" %>


<%-- Expression Language EL :   --%>
<h1>EL</h1>

<p> Operateur ternaire : Bonjour ${ empty name ? '' : name }</p>
<p>Valeur d'un tableau : ${ noms[2] }</p>

<%-- acceder a un oblet Netbean   --%>
<p>Objet Netbean : Bonjour ${ auteur.prenom } ${ auteur.nom }</p>
<p>Objet Netbean : ${ auteur.actif ? 'Vous êtes très actif !' : 'Vous êtes inactif !' }</p> 
 

<%-- JSTL  --%>
<h1>JSTL</h1>

<p>Introduite par le prefix "c" cf. taglibs.jsp  </p>

<h2>ECRIRE</h2>
<%-- balise out : Affichage simple, sans interpretation des balises html (faille xss) --%>
<p>Escap des tags xml (evite faille XSS): <c:out value="<b>Bonjour !</b>" /></p>

<%-- balise out : Affichage simple, sans interpretation des balises html (faille xss) --%>
<p>Sans Escap des tags (escapeXml="false""): <c:out value="<b>Bonjour !</b>" escapeXml="false"/></p>


<%-- balise out : evaluer une expression --%>
<p>Ecrire depuis un tableau: <c:out value="${noms[2]}" /></p>
<p>Operteur ternaire: <c:out value= "${empty name ? 'toto' : name}"/></p>

<%-- balise out : valeur par defaut  --%>
<p>Valeur par defaut ex 1: <c:out value= "${name}" default="Valeur par defaut"/></p>
<p>Valeur par defaut ex 2: <c:out value= "${name}" >Valeur par defaut</c:out></p>

<%-- VARIABLE --%>
<h2>VARIABLES</h2>
<c:set var="pseudo" value="Mateo21" scope="page"/>
<%-- autre scope possible : request, session, application --%>
<c:set var="pseudo" scope="page">Mateo12</c:set>
<p><c:out value= "${pseudo}"/></p>
<%-- Netbeans --%>
<b>Netbeans</b>
<p>Afficher: <c:out value= "${auteur.prenom}"/></p>
<c:set target="${auteur}" property="prenom" value="tutu"/>
<p>Modifier: <c:out value= "${auteur.prenom}"/></p>
<%--  Supression variable de la memoire --%>
<c:remove var="pseudo" scope="page"/>

<%-- TESTS CONDITIONS--%>
<h2>TESTS</h2>
<c:if test="${50>10}" var="resultat_du_test" scope="session">
<p>C'est vrai!</p>
</c:if>
<p>
Choix mutliple, resultat :
<c:choose>
	<c:when test="${empty name }">name est vide</c:when>
	<c:otherwise>${name}</c:otherwise>
</c:choose>
</p>

<%-- BOUCLES --%>
<h2>BOUCLES</h2>

<c:forEach var="i" begin="0" end="10" step="1">
<p>Message :<c:out value="${i}"/> </p>
</c:forEach>

<b>Autre test:</b>
<c:forEach var="i" begin="0" end="10" step="2">
<p>Message :<c:out value="${i}"/> </p>
</c:forEach>

<b>Parcourir un tableau :</b>
<c:forEach items="${noms}" var="nom">
<p>Nom :<c:out value="${nom}"/> </p>
</c:forEach>

<c:forEach items="${noms}" var="nom" begin="0" end="1">
<p>Nom :<c:out value="${nom}"/> </p>
</c:forEach>

<c:forEach items="${noms}" var="nom" varStatus="status">
<p>Boucle : <c:out value="${status.count}"/>Nom :<c:out value="${nom}"/> </p>
</c:forEach>
<%-- autres attributs status :count, index, current, first, last  --%>

<b>Chaine de char: découpage</b>

<c:forTokens var="morceau" items="un/deux/trois/quatre" delims="/">
<p>${morceau}</p>
</c:forTokens>




<%-- HTML + JAVA --%>
<h1>JSP : du Java et du Html (éviter, utiliser EL ou JSTL)</h1>

<p>
	<%
		String name = (String) request.getAttribute("name");
		out.println(name);
	%>

!</p>
<p>
	<%
		String variable = (String) request.getAttribute("var");
	    out.println(variable);
	%>
</p>
<p>
	<%
		for (int i = 0 ; i < 20 ; i++){
			out.println("Une nouvelle ligne !<br>");
		}
	%>
</p>
<p>
	<%
		String heure = (String) request.getAttribute("heure");
	    if (heure.equals("jour")){
	    	out.println("Bonjour");
	    }else{
	    	out.println("Bonsoir");
	    }
	  
	%>
</p>



</body>
</html>