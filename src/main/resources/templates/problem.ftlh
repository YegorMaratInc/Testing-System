<#ftl encoding='UTF-8'>
<#import "/spring.ftl" as spring/>
<!doctype html>
<html lang="ru">
<head>
    <link href="<@spring.url '/css/bootstrap.min.css'/>" rel="stylesheet" type="text/css">
    <link href="<@spring.url '/css/style.css'/>" rel="stylesheet" type="text/css">
    <script src="<@spring.url '/js/jquery-3.4.1.min.js'/>"></script>
    <title>ITSprint->Проблема ${problem.name}</title>
    <style>
        h3 {
            color: #17a2b8;
            background: #c82333;
            display: flex;
            justify-content: center;

        }

        h4 {
            color: #c82333;
            display: flex;
        }

        body {
            background-color: #34ce57;
        }
    </style>
</head>
<body>
<h1>${problem.shortName}.${problem.name}</h1>
<h4>Ограничения по времени: ${problem.timeLimit} сек</h4>
<div class="text-dark">
    ${problem.content}
</div>
<div>
    <a href="/submit/contest/${problem.contest.id}">Сдать!</a>
</div>
<div>
    <a href="/contest/${problem.contest.id}">Вернуться к списку задач</a>
</div>
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
                <time></time>
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
<a href="/question/${problem.id}">Задать вопрос!</a>
<a href="/scoreboard/${problem.contest.id}">Scoreboard</a>

</body>
<#--TODO fix style problems-->
</html>