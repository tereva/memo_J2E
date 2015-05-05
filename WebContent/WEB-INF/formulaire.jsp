<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8" />
        <title>Exemple formulaire</title>
    </head> 

<body>

<%@ include file="menu.jsp" %>


<c:if test="${!empty form.resultat }"><p><c:out value="Resultat : ${form.resultat}"/></p></c:if>


<form method="post" action="formulaire">
<p>
	<label for="login">Login :</label>
	<input type="text" id="login" name="login">
</p>
<p>
	<label for="pass">Password :</label>
	<input type="password" id="pass" name="pass">
</p>
	
	<input type="submit"/>
</form>

</body>