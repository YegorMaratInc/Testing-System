<#ftl encoding='UTF-8'>
<#import "/spring.ftl" as spring/>
<!doctype html>
<html lang="ru">
<head>
    <#include "includes.ftlh"/>
    <title>AlgoSprint->Все задачи</title>
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
                            <th>
                                <a href="/contest/${problem.contest.id}/problem/${problem.shortName}">${problem.contest.id}${problem.shortName}</a>
                            </th>
                            <th>
                                <a href="/contest/${problem.contest.id}/problem/${problem.shortName}">${problem.name}</a>
                            </th>
                            <th>${problem.timeLimit} sec</th>
                        </tr>
                    </#list>
                </table>
            </div>
        </div>
    </div>
</div>
</body>
</html>