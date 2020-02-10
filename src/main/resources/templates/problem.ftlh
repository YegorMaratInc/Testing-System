<#ftl encoding='UTF-8'>
<#import "/spring.ftl" as spring/>
<!doctype html>
<html lang="ru">
<head>
    <link href="<@spring.url '/css/bootstrap.min.css'/>" rel="stylesheet" type="text/css">
    <link href="<@spring.url '/css/style.css'/>" rel="stylesheet" type="text/css">
    <script src="<@spring.url '/js/jquery-3.4.1.min.js'/>"></script>
    <title>ITSprint->Проблема ${problem.name}</title>
</head>
<body>
    <h4>Условиe</h4>
<div class="form-control-file">
    ${problem.condition}
</div>
<div>
    <a href="/submit/contest/${problem.contest.id}">Сдать!</a>
</div>
<div>
    <a href="/contest/${problem.contest.id}">Вернуться к списку задач</a>
</div>
<div>
    <h3 class="h5">Вопросы к задаче:</h3>
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
    <a href="/contest/${problem.contest.id}/problem/${problem.id}/ask">Задать аопрос!</a>
</div>

</body>
</html>