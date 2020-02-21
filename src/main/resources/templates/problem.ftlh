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
    <tr>
        <th>Вопрос:</th>
        <th>Ответ:</th>
        <th>Вопрос задал</th>
    </tr>
    <#list questions as ques>
        <tr>
            <th>${ques.question}</th>
            <th>${ques.answer}</th>
            <th>${ques.owner.firstName}</th><#-- сделать ссылку на аккаунт и создать аккаунты-->
        </tr>
    </#list>
</table>
<a href="/question/${problem.id}">Задать вопрос!</a>


</body>
<#--TODO fix style problems-->
</html>