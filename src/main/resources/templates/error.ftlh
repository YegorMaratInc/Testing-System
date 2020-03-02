<#ftl encoding='UTF-8'>
<#import "/spring.ftl" as spring/>
<!doctype html>
<html lang="ru">
<head>
    <link href="<@spring.url '/css/bootstrap.min.css'/>" rel="stylesheet" type="text/css">
    <link href="<@spring.url '/css/style.css'/>" rel="stylesheet" type="text/css">
    <script src="<@spring.url '/js/jquery-3.4.1.min.js'/>"></script>
    <title>ITSprint->Активные контесты</title>
</head>
<body>
<#include "navBar.ftlh">
<div class="container">
    <div class="jumbotron">
        <h1 class="text-center"><i class="fa fa-frown-o"> </i> Что-то пошло не так! :( </h1>
        <p class="text-center"><a class="btn btn-primary" href="/"><i class="fa fa-home"></i>Домашняя страница</a></p>
    </div>
</div>
</body>
</html>