<#ftl encoding='UTF-8'>
<#import "/spring.ftl" as spring/>
<!doctype html>
<html lang="ru">
<head>
    <#include "includes.ftlh"/>
    <title>ITSprint->Активные контесты</title>
    <style>
        .container {
            display: flex;
            align-items: center;
            justify-content: center;
        }
    </style>
</head>
<body>
<#include "navBar.ftlh">
<div class="container">
    <div class="card w-75">
        <div class="card-header text-center">
            <div class="card-title h2">
                Активные контесты
            </div>
        </div>
        <div class="card-body">
            <div class="card-text text-center">
                <table class="table table-bordered table-hover">
                    <tr class="thead-dark">
                        <th>Название</th>
                        <th>Начало</th>
                        <th>Конец</th>
                    </tr>
                    <#list contests as contest>
                        <tr>
                            <th><a href="/contest/${contest.id}">${contest.title}</a></th>
                            <th>${contest.startTime}</th>
                            <th>${contest.finishTime}</th>
                        </tr>
                    </#list>
                </table>
            </div>
        </div>
    </div>
</div>
</body>
</html>