<#ftl encoding='UTF-8'>
<#import "/spring.ftl" as spring/>
<!doctype html>
<html lang="ru">
<head>
    <#include "includes.ftlh"/>
    <title>ITSprint-> Профиль ${user.login}</title>
</head>
<body>
<#include "navBar.ftlh">
<#if role == true>
    <div>
        <h6><a href="/create">Создать контест</a></h6>
        <h6><a href="/users">Список пользователей</a></h6>
    </div>
</#if>
<div class="container">
    <div class="card">
        <div class="card-header">
            <div class="card-title">
                <h3>
                    Последние посылки
                </h3>
            </div>

        </div>
        <div class="card-body">
            <div class="card-text text-center">
                <table class="table table-bordered table-hover">
                    <tr class="thead-dark">
                        <th>№</th>
                        <th>Дата</th>
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
</div>
</body>
</html>