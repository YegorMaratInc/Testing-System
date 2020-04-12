<#ftl encoding='UTF-8'>
<#import "/spring.ftl" as spring/>
<!doctype html>
<html lang="ru">
<head>
    <#include "includes.ftlh"/>
    <title>ITSprint-> Профиль ${user.login}</title>
    <style>
        .card {
            margin-left: 1px;
            margin-right: 1px;
        }

        .card-img-top {
            background-size: 150px 150px;
        }
    </style>
</head>
<body>
<#include "navBar.ftlh">
<div class="container-fluid">
    <div class="card-columns p-6">
        <div class="card border-dark">
            <div class="card-header text-center">
                <h3 class="card-text">Профиль</h3>
            </div>
            <div class="card-body">
                <h5 class="card-title text-center">${user.firstName} ${user.lastName}</h5>
                <ul class="list-group list-group-flush">
                    <li class="list-group-item">Количество решенный задач:</li>${problemsAccepted}
                </ul>
            </div>
        </div>
        <#if role == true>
            <div class="card border-dark">
                <div class="card-body text-center">
                    <div class="card-header text-center">
                        <h3 class="card-text">Панель админа</h3>
                    </div>
                    <div сlass="card-body">
                        <div class="btn-group-vertical btn-group-xs" role="group" aria-label="Admin Panel">
                            <a role="button" class="btn btn-outline-dark" href="<@spring.url '/create'/>">
                                Создать контест
                            </a>
                            <a role="button" class="btn btn-outline-dark" href="<@spring.url '/users'/>">
                                Список пользователей
                            </a>
                            <a role="button" class="btn btn-outline-dark" href="<@spring.url '/createGhost'/>">
                                Создать пользователя
                            </a>
                        </div>
                    </div>
                </div>
            </div>
        </#if>
        <div class="card border-dark " style="width: 50rem;">
            <div class="card-header text-center">
                <div class="card-title">
                    <h3>
                        Последние посылки
                    </h3>
                </div>
            </div>
            <div class="card-body">
                <div class="card-text text-center">
                    <table class="table table-bordered table-hover table-responsive-md">
                        <thead>
                        <tr class="thead-dark">
                            <th>№</th>
                            <th>Дата</th>
                            <th>Задача</th>
                            <th>Язык</th>
                            <th>Вердикт</th>
                            <th>Last test</th>
                            <th>Log</th>
                        </tr>
                        </thead>
                        <tbody>
                        <#list submissions as sub>
                            <tr>
                                <td>${sub.id}</td>
                                <td>${sub.submissionTime}</td>
                                <td>${sub.problem.contest.id}${sub.problem.shortName} ${sub.problem.name}</td>
                                <td>${sub.language.name}</td>
                                <td>${sub.state.name()}</td>
                                <td>${sub.lastTest}</td>
                                <td>${sub.log}</td>
                            </tr>
                        </#list>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>