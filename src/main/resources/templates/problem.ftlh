<#ftl encoding='UTF-8'>
<#import "/spring.ftl" as spring/>
<!doctype html>
<html lang="ru">
<head>
    <#include "includes.ftlh"/>
    <title>ITSprint->Проблема ${problem.shortName}</title>
</head>
<body>
<#include "navBar.ftlh">
<div class="container">
    <div class="card">
        <div class="card-header text-center">
            <div class="btn-group btn-group-lg" role="group" aria-label="MiniNavBar">
                <a role="button" class="btn btn-outline-dark" href="<@spring.url '/contest/${problem.contest.id}'/>">
                    Вернуться к списку задач
                </a>
                <a role="button" class="btn btn-outline-dark" href="<@spring.url '/scoreboard/${problem.contest.id}'/>">
                    Таблица результатов
                </a>
                <a role="button" class="btn btn-outline-dark"
                   href="<@spring.url '/submissions/contest/${problem.contest.id}'/>">
                    Мои посылки
                </a>
                <a role="button" class="btn btn-outline-dark" href="<@spring.url '/question/${problem.id}'/>">
                    Задать вопрос
                </a>
            </div>
        </div>
        <div class="card-body">
            <div class="jumbotron text-center">
                <h1>${problem.shortName}. ${problem.name}</h1>
                <p>Ограничения по времени: ${problem.timeLimit} </p>
            </div>
            <p class="card-text">
            <h4>Условие</h4>
            ${problem.content}
            </p>
            <p class="card-text">
            <h4>Входные данные</h4>
            ${problem.inputFormat}
            </p>
            <p class="card-text">
            <h4>Выходные данные</h4>
            ${problem.outputFormat}
            </p>
            <a role="button" class="btn btn-outline-dark btn-lg btn-block"
               href="<@spring.url '/submit/contest/${problem.contest.id}'/>">
                Сдать!
            </a>
        </div>
        <div class="card-body">
            <h4>
                Вопросы к задаче:
            </h4>
            <table class="table table-hover table-responsive-md">
                <thead class="thead-dark">
                <tr>
                    <th>Id:</th>
                    <th>Time:</th>
                    <th>Вопрос задал</th>
                    <th>Вопрос</th>
                    <th>Ответ</th>
                </tr>
                </thead>
                <tbody>
                <#list questions as ques>
                    <tr>
                        <th>${ques.id}</th>
                        <th>
                            <span id="time${ques.id}">${ques.date?datetime}</span>
                        </th>
                        <th><a href="/profile/${ques.owner.login}">${ques.owner.login}</a></th>
                        <th><span>${ques.question}</span></th>
                        <#if ques.answer != "">
                            <th><span>${ques.answer}</span></th>
                        </#if>
                        <#if ques.answer == "">
                            <th><a href="/reply/${ques.id}">Reply!</a></th>
                        </#if>
                    </tr>
                </#list>
                </tbody>
            </table>
        </div>
    </div>
</div>
</div>
<#--    <div class="btn-group btn-group-lg" role="group" aria-label="MiniNavBar">
        <a role="button" class="btn btn-outline-info" href="<@spring.url '/contest/${problem.contest.id}'/>">
            Вернуться к списку задач
        </a>
        <a role="button" class="btn btn-outline-info" href="<@spring.url '/scoreboard/${problem.contest.id}'/>">
            Таблица результатов
        </a>
        <a role="button" class="btn btn-outline-info" href="<@spring.url '/submission/contest/${problem.contest.id}'/>">
            Мои посылки
        </a>
        <a role="button" class="btn btn-outline-info" href="<@spring.url '/question/${problem.id}'/>">
            Задать вопрос
        </a>
    </div>
    <div class="jumbotron text-center">
        <h1>${problem.shortName}.${problem.name}</h1>
        <p>Ограничения по времени: ${problem.timeLimit} </p>
    </div>
    <div class="card">
        <div class="card-body">
            ${problem.content}
        </div>
    </div>
    <a role="button" class="btn btn-primary btn-lg btn-block"
       href="<@spring.url '/submit/contest/${problem.contest.id}'/>">
        Сдать!
    </a>
</div>
<#--
<h1>${problem.shortName}.${problem.name}</h1>
<h4>Ограничения по времени: ${problem.timeLimit} сек</h4>
<div class="text-area">
    ${problem.content}
</div>
<a href="/submit/contest/${problem.contest.id}">Сдать!</a>
<a href="/contest/${problem.contest.id}">Вернуться к списку задач</a>
<a href="/question/${problem.id}">Задать вопрос!</a>
<a href="/scoreboard/${problem.contest.id}">Scoreboard</a>
<h3>
    Вопросы к задаче:
</h3>
<table class="table">
    <thead>
    <tr>
        <th>Id:</th>
        <th>Time:</th>
        <th>Вопрос задал</th>
        <th>Вопрос</th>
        <th>Ответ</th>
    </tr>
    </thead>
    <tbody>
    <#list questions as ques>
        <tr>
            <th>${ques.id}</th>
            <th>
                <span id="time${ques.id}">${ques.date?datetime}</span>
            </th>
            <th><a href="/profile/${ques.owner.login}">${ques.owner.login}</a></th>
            <th><span>${ques.question}</span></th>
            <#if ques.answer != "">
                <th><span>${ques.answer}</span></th>
            </#if>
            <#if ques.answer == "">
                <th><a href="/reply/${ques.id}">Reply!</a></th>
            </#if>
        </tr>
    </#list>
    </tbody>
</table>
-->
</body>
<#--TODO fix style problems-->
</html>