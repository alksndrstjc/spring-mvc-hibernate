<%--
  Created by IntelliJ IDEA.
  User: Aleksandar
  Date: 12.6.2018.
  Time: 22.11
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Recipe details</title>
</head>
<body>
<h1>${recipe.name}</h1>
<p>${recipe.description}</p><br>
<h2>Ingredients: </h2>
<p>Flour: ${ingredient.flour}</p><br>
<p>Sugar: ${ingredient.sugar}</p><br>
<p>Eggs: ${ingredient.eggs}</p><br>
<p>Chocolate: ${ingredient.chocolate}</p><br>
</body>
</html>
