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
    </style>
</head>
<body>
<#include "navBar.ftlh">
<div class="container">
    <div class="card-columns p-6">
        <div class="card border-dark">
            <div class="card-header text-center">
                <h1 class="card-text">Профиль</h1>
            </div>
            <div class="card-body">
                <img class="card-img-top" src="https://1eu.funnyjunk.com/pictures/Apu+and+frens_5ec876_6904703.jpg"
                     alt="Аватарка">
                <h5 class="card-title text-center">${user.firstName} ${user.lastName}</h5>
                <ul class="list-group list-group-flush">
                    <li class="list-group-item">Количество решенный задач:</li>
                    <li class="list-group-item">Пол:</li>
                    <li class="list-group-item">Полных лет:</li>
                </ul>
            </div>
        </div>
        <div class="card border-dark " style="width: 50rem;">
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
                        <tbody>
                        <tr class="thead-dark">
                            <th>№</th>
                            <th>Дата</th>
                            <th>Задача</th>
                            <th>Язык</th>
                            <th>Вердикт</th>
                            <th>Last test</th>
                            <th>Log</th>
                        </tr>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
        <#if role == true>
            <div class="card border-dark">
                <div class="card-body">
                    <h5 class="card-title">Панель админа:</h5>
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
        </#if>
    </div>
</div>
</body>
</html>