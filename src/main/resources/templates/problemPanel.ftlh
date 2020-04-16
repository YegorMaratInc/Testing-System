<#ftl encoding='UTF-8'>
<#import "/spring.ftl" as spring/>
<!doctype html>
<html lang="ru">
<head>
    <#include "includes.ftlh"/>
    <title>AlgoSprint->${contest.title}</title>
</head>
<body>
<#include "navBar.ftlh">
<div class="container">
    <div class="card">
        <div class="card-header text-center">
            <div class="card-title h2">
                Задачи
            </div>
        </div>
        <div class="card-body">
            <div class="card-text text-center">
                <table class="table table-bordered table-hover table-responsive-md">
                    <tr class="thead-dark">
                        <th>№</th>
                        <th>Название</th>
                        <th>Лимит по времени</th>
                    </tr>
                    <#list problems as problem>
                        <tr>
                            <th><a href="/contest/${contest.id}/problem/${problem.shortName}">${problem.shortName}</a>
                            </th>
                            <th><a href="/contest/${contest.id}/problem/${problem.shortName}">${problem.name}</a>
                            </th>
                            <th>${problem.timeLimit} sec</th>
                        </tr>
                    </#list>
                </table>
            </div>
        </div>
        <div class="card-body">
            <div class="text-center">
                <a role="button" class="btn btn-outline-dark myBtn" href="/scoreboard/${contest.id}">
                    Результаты
                </a>
                <#if role == true>
                    <a role="button" class="btn btn-outline-dark myBtn" href="/create/contest/${contest.id}">
                        Создать задачу
                    </a>
                </#if>
            </div>
        </div>
    </div>
</div>
<div>
</div>

</body>
</html>