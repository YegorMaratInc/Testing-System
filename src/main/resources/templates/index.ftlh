<#ftl encoding='UTF-8'>
<#import "/spring.ftl" as spring/>
<!doctype html>
<html lang="ru">
<head>
    <link href="<@spring.url '/css/bootstrap.min.css'/>" rel="stylesheet" type="text/css">
    <link href="<@spring.url '/css/style.css'/>" rel="stylesheet" type="text/css">
    <script src="<@spring.url '/js/jquery-3.4.1.min.js'/>"></script>
    <title>ITSprint->Активные контесты</title>
</head>
<body>
<#--TODO fill active contests home page -->
<form method="get" action="<@spring.url '/'/>">
    <table>
        <caption>Активные контесты</caption>
        <tr>
            <th>Название</th>
            <th>Начало</th>
            <th>Конец</th>
        </tr>
        <#list contests as contest>
            <tr>
                <th><a href="/contest/${contest.id}">${contest.title}</a></th>
                <th>${contest.startTime}</th>
                <th>${contest.finishTime}</th>
            </tr>
        </#list>
    </table>
    <div class="text-right">
        <a href="/profile/${login}">Профиль</a>
    </div>
</form>
</body>
</html>