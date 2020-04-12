<#ftl encoding='UTF-8'>
<#import "/spring.ftl" as spring/>
<!doctype html>
<html lang="ru">
<head>
    <#include "includes.ftlh"/>
    <title>ITSprint->Все проблемы</title>
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
    <div class="card w-50">
        <div class="card-header text-center">
            <div class="card-title h2">
                Задачи
            </div>
        </div>
        <div class="card-body">
            <div class="card-text text-center">
                <div class="table-responsive">
                    <table class="table table-bordered table-hover>
                    <tr class=" thead-dark
                    ">
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
</div>
</body>
</html>