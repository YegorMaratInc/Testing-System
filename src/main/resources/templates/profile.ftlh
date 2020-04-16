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
<div class="container-xl">
    <div class="row row-cols-1 row-cols-md-2">
        <div class="col-12 col-md-4 mb-3 order-first">
            <div class="card border-dark">
                <div class="card-header text-center">
                    <h3>Профиль</h3>
                </div>
                <div class="card-body text-center">
                    <h4 class="card-title">${user.firstName} ${user.lastName}</h4>
                    <p class="card-text">
                    <div class="h3">Решено: ${problemsAccepted}</div>
                    <p class="card-text">
                        <#if role == true>
                    <div class="btn-group-vertical" role="group" aria-label="Admin Panel">
                        <a role="button" class="btn btn-outline-dark myBtn" href="<@spring.url '/create'/>">
                            Создать контест
                        </a>
                        <a role="button" class="btn btn-outline-dark myBtn" href="<@spring.url '/users'/>">
                            Список пользователей
                        </a>
                        <a role="button" class="btn btn-outline-dark myBtn" href="<@spring.url '/createGhost'/>">
                            Создать пользователя
                        </a>
                    </div>
                    </#if>
                </div>
            </div>
        </div>

        <div class="col-12 col-md-8">
            <div class="card border-dark">
                <div class="card-header text-center">
                    <div class="card-title">
                        <h3>
                            Последние посылки
                        </h3>
                    </div>
                </div>
                <div class="card-body">
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
                                <td>
                                    <button type="button" class="btn btn-primary" data-toggle="modal${sub.id}"
                                            data-target="#modal${sub.id}">
                                        Launch demo modal
                                    </button>

                                    <!-- Modal -->
                                    <div class="modal fade" id="modal${sub.id}" tabindex="-1" role="dialog"
                                         aria-labelledby="modal${sub.id}Label" aria-hidden="true">
                                        <div class="modal-dialog" role="document">
                                            <div class="modal-content">
                                                <div class="modal-header">
                                                    <h5 class="modal-title" id="modal${sub.id}Label">Логи посылки
                                                        №${sub.id}</h5>
                                                    <button type="button" class="close" data-dismiss="modal${sub.id}"
                                                            aria-label="Close">
                                                        <span aria-hidden="true">&times;</span>
                                                    </button>
                                                </div>
                                                <div class="modal-body">
                                                    ${sub.log}
                                                </div>
                                                <div class="modal-footer">
                                                    <button type="button" class="btn btn-outline-dark myBtn"
                                                            data-dismiss="modal${sub.id}">Close
                                                    </button>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </td>
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