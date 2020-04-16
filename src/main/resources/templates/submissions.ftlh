<#ftl encoding='UTF-8'>
<#import "/spring.ftl" as spring/>
<!doctype html>
<html lang="ru">
<head>
    <#include "includes.ftlh"/>
    <title>ITSprint->Ваши посылки</title>
</head>
<body>
<#include "navBar.ftlh">
<div class="container-fluid">
    <div class="card">
        <div class="card-header text-center">
            <div class="card-title h3">
                Последние посылки
            </div>
        </div>
        <div class="card-body">
            <table class="table table-bordered table-hover table-responsive-md">
                <tr class="thead-dark">
                    <th>№</th>
                    <th>Дата</th>
                    <th>Отправитель</th>
                    <th>Задача</th>
                    <th>Язык</th>
                    <th>Вердикт</th>
                    <th>Last test</th>
                    <th>Log</th>
                </tr>
                <#list submissions as sub>
                    <tr>
                        <th><a href="/submission/${sub.id}">${sub.id}</a></th>
                        <th>${sub.submissionTime}</th>
                        <th><a href="/profile/${sub.owner.login}">${sub.owner.login}</a></th>
                        <th>
                            <a href="/contest/${sub.problem.contest.id}/problem/${sub.problem.shortName}">${sub.problem.shortName}
                                - ${sub.problem.name}</a></th>
                        <th>${sub.language.name}</th>
                        <th>${sub.state.name()} </th>
                        <th>${sub.lastTest}</th>
                        <th>${sub.log}</th>
                    </tr>
                </#list>
            </table>
        </div>
    </div>
</div>
</body>
</html>