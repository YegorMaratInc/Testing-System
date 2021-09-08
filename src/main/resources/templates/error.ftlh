<#ftl encoding='UTF-8'>
<#import "/spring.ftl" as spring/>
<!doctype html>
<html lang="ru">
<head>
    <#include "includes.ftlh"/>
    <title>AlgoSprint->Ошибка</title>
</head>
<body>
<#include "navBar.ftlh">
<div class="container">
    <div class="jumbotron text-center">
        <h1 class="display-4"> Что-то пошло не так! :( </h1>
        <div id="collapsedError" class="collapse my-3" aria-labelledby="errorHeading">
            <div class="orangeCardHeader">
                <h1 class="text-muted">Статус ${status} -> ${error}: {${message}}</h1>
            </div>
        </div>
        <div class="btn-group">
            <a class="btn btn-outline-dark myBtn" role="button" data-toggle="collapse" aria-expanded="false"
               aria-controls="collapsedError" href="#collapsedError">
                Описание проблемы
            </a>
            <a class="btn btn-outline-dark myBtn" href="/">Домашняя страница</a>
        </div>
    </div>
</div>
</body>
</html>