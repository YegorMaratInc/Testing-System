<#ftl encoding='UTF-8'>
<#import "/spring.ftl" as spring/>
<!doctype html>
<html lang="ru">
<head>
    <#include "includes.ftlh"/>
    <title>ITSprint->Проблема ${problem.shortName}</title>
    <style>
        .table-light:hover {
            background: #FF7F50;
        }
    </style>
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
                   href="<@spring.url '/submissions/contest/${problem.contest.id}/my'/>">
                    Мои посылки
                </a>
                <a role="button" class="btn btn-outline-dark"
                   href="<@spring.url '/submissions/contest/${problem.contest.id}'/>">
                    Статус
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
            <h4>Формат ввода</h4>
            ${problem.inputFormat}
            </p>
            <p class="card-text">
            <h4>Формат вывода</h4>
            ${problem.outputFormat}
            </p>
            <p class="card-text">
            <h4>Пример</h4>
            <div id="example"></div>
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
                    <tr class="table-light">
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
<script type="text/javascript">
    $(document).ready(function () {
        let span = $('#example');
        let ex = "${problem.example}";
        span.html("<h5>Входные данные:</h5>" + ex.split(':')[0] + "<br><h5>Выходные данные:</h5>" + ex.split(':')[1]);
    });
</script>
</body>
</html>