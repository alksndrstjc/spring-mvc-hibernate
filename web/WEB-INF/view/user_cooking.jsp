<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>HTML5 kuhinja</title>
    <meta charset="utf-8"/>
    <style type="text/css">
        header, section, footer, aside, nav, article, figure, figcaption {
            display: block;
        }

        body {
            color: #666666;
            background-color: #f9f8f6;
            background-position: center;
            font-family: Georgia, Times, serif;
            line-height: 1.4em;
            margin: 0px;
        }

        .wrapper {
            width: 940px;
            margin: 20px auto 20px auto;
            border: 2px solid #000000;
            background-color: #ffffff;
        }

        header {
            height: 160px;
            background-image: url("/WEB-INF/resources/header-7.png");
            background-size: cover;
            padding-top: 20px;
        }

        h1 {
            text-indent: 20px;
            width: 940px;
            height: 110px;
            margin: 0px;
        }

        nav, footer {
            clear: both;
            color: #ffffff;
            background-color: #aeaca8;
            height: 30px;
        }

        nav ul {
            margin: 0px;
            padding: 5px 0px 5px 30px;
        }

        nav li {
            display: inline;
            margin-right: 40px;
        }

        nav li a {
            color: #ffffff;
        }

        nav li a:hover, nav li a.current {
            color: #000000;
        }

        section.courses {
            float: left;
            width: 659px;
            border-right: 1px solid #eeeeee;
        }

        article {
            clear: both;
            overflow: auto;
            width: 100%;
        }

        .hgroup {
            margin-top: 40px;
        }

        figure {
            float: left;
            width: 290px;
            height: 220px;
            padding: 5px;
            margin: 20px;
            border: 1px solid #eeeeee;
        }

        figcaption {
            font-size: 90%;
            text-align: left;
        }

        aside {
            width: 230px;
            float: left;
            padding: 0px 0px 0px 20px;
        }

        aside section a {
            display: block;
            padding: 10px;
            border-bottom: 1px solid #eeeeee;
        }

        aside section a:hover {
            color: #985d6a;
            background-color: #efefef;
        }

        a {
            color: #de6581;
            text-decoration: none;
        }

        h1, h2, h3 {
            font-weight: normal;
        }

        h2 {
            margin: 10px 0px 5px 0px;
            padding: 0px;
        }

        h3 {
            margin: 0px 0px 10px 0px;
            color: #de6581;
        }

        aside h2 {
            padding: 30px 0px 10px 0px;
            color: #de6581;
        }

        footer {
            font-size: 80%;
            padding: 7px 0px 0px 20px;
        }
    </style>
    <!--[if lt IE 9]>
    <script src="http://html5shiv.googlecode.com/svn/trunk/html5.js"></script>
    <![endif]-->
</head>
<body>
<div class="wrapper">
    <header>
        <h1>NiCAT kuhinja</h1>
        <nav>
            <ul>
                <li><a href="" class="current">Prva strana</a></li>
                <li><a href="">Kursevi</a></li>
                <li><a href="">Ketering</a></li>
                <li><a href="">O NiCAt-u</a></li>
                <li><a href="">Kontakt</a></li>
                <li><a href="/">Log out</a></li>
            </ul>
        </nav>
    </header>

    <section class="courses" id="section">
        <c:if test="${isSet}">
            <a href="/getrecipeinfo?id=${recipeFirst.id_recipe}">
                <article>
                    <figure>
                        <img src="${recipeFirst.imgFilePath}" alt="${recipeFirst.name}"/>
                        <figcaption>${recipeFirst.name}</figcaption>
                    </figure>
                    <div class="hgroup">
                        <h2>${recipeFirst.name}</h2>
                    </div>
                    <p>${recipeFirst.briefDescription}</p>
                </article>
            </a>
            <c:forEach var='recipe' items='${recipes}'>
                <c:if test="${recipe.id_recipe != recipeFirst.id_recipe}">
                    <a href="/getrecipeinfo?id=${recipe.id_recipe}" id="${recipe.id_recipe}">
                        <article>
                            <figure>
                                <img src="${recipe.imgFilePath}" alt="${recipe.name}"/>
                                <figcaption>${recipe.name}</figcaption>
                            </figure>
                            <div class="hgroup">
                                <h2>${recipe.name}</h2>
                            </div>
                            <p>${recipe.briefDescription}</p>
                        </article>
                    </a>
                </c:if>
            </c:forEach>
        </c:if>
        <c:if test="${!isSet}">
            <c:forEach var='recipe' items='${recipes}'>
                <a href="/getrecipeinfo?id=${recipe.id_recipe}" id="${recipe.id_recipe}">
                    <article>
                        <figure>
                            <img src="${recipe.imgFilePath}" alt="${recipe.name}"/>
                            <figcaption>${recipe.name}</figcaption>
                        </figure>
                        <div class="hgroup">
                            <h2>${recipe.name}</h2>
                        </div>
                        <p>${recipe.briefDescription}</p>
                    </article>
                </a>
            </c:forEach>
        </c:if>
    </section>
    <aside>
        <section class="popular-recipes">
            <h2>Popularni recepti</h2>
            <ul>
                <c:forEach var="recipe" items="${recipes}">
                    <li><a href="/swapRecipesOrder?id=${recipe.id_recipe}">${recipe.name}</a></li>
                </c:forEach>
            </ul>
        </section>
        <section class="contact-details">
            <h2>User</h2>
            <p>${user.username}<br/>
                broj recepata: ${recipes.size()}<br/>
            </p>
        </section>
    </aside>
    <footer>
        &copy; 2018 NiCAT
    </footer>
</div><!-- .wrapper -->
</body>
</html>