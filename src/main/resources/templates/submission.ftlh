<#ftl encoding='UTF-8'>
<#import "/spring.ftl" as spring/>
<!doctype html>
<html lang="ru">
<head>
    <link href="<@spring.url '/css/bootstrap.min.css'/>" rel="stylesheet" type="text/css">
    <link href="<@spring.url '/css/style.css'/>" rel="stylesheet" type="text/css">
    <script src="<@spring.url '/js/jquery-3.4.1.min.js'/>"></script>
    <title>ITSprint->Ваши посылки</title>
</head>
<body>
<form method="get" action="/submission/${submission.id}">
    <#include "navBar.ftlh">
    <table>
        <thead>
        <tr>
            <th>Время</th>
            <th>Отправитель</th>
            <th>Язык</th>
            <th>Задача</th>
            <th>Вердикт</th>
        </tr>
        </thead>
        <tbody>
        <tr>
            <th>Too late</th>
            <th><a href="/profile/${submission.owner.login}">${submission.owner.login}</a></th>
            <th>${submission.language.name}</th>
            <th>
                <a href="/contest/${submission.problem.contest.id}/problem/${submission.problem.shortName}">${submission.problem.contest.id}${submission.problem.shortName}
                    .${submission.problem.name}</a></th>
            <th>${submission.state.name()}</th>
        </tr>
        </tbody>
    </table>
</form>
</body>
</html>