<%-- 
    Document   : apodoValido
    Created on : 26-ene-2016, 18:29:40
    Author     : jesus
--%>

<% if ("No".equals(request.getAttribute("idvalido"))) { %>
Id no v�lido, ya est� en la BD
<% } else { %>
OK
<%}%>
