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
<div class="container">
    <div class="row align-content-center">
        <div class="col-lg-4 col-md-4 col-xs-12">
            <div class="card">
                <div class="card-header">
                    Профиль
                </div>
                <div class="card-body">
                    <img class="card-img-top" src="https://1eu.funnyjunk.com/pictures/Apu+and+frens_5ec876_6904703.jpg"
                         alt="Аватарка">
                    <h5 class="card-title">Имя Фамилия</h5>
                    <p class="card-text">Что-то</p>
                </div>
                <ul class="list-group list-group-flush">
                    <li class="list-group-item">Количество решенный задач:</li>
                    <li class="list-group-item">Пол:</li>
                    <li class="list-group-item">Полных лет:</li>
                </ul>
            </div>
        </div>
        <div class="col-lg-8 col-md-8 col-xs-12">
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
        <#if role == true>
            <div class="col-lg-10 col-md-4 col-xs-12">
                <div class="card w-25">
                    <div class="card-body">
                        <h5 class="card-title">Панель админа</h5>
                        <div сlass="card-body">
                            <h6>
                                <form class="form-inline" method="get" action="<@spring.url '/create'/>">
                                    <button class="btn btn-outline-dark my-2 my-lg-0 btn-my" role="button"
                                            type="submit">
                                        Создать контест
                                    </button>
                                </form>
                                <form class="form-inline" method="get" action="<@spring.url '/users'/>">
                                    <button class="btn btn-outline-dark my-2 my-lg-0 btn-my" role="button"
                                            type="submit">
                                        Список пользователей
                                    </button>
                                </form>
                            </h6>
                        </div>
                    </div>
                </div>
            </div>
        </#if>
    </div>
</div>

</body>
</html>