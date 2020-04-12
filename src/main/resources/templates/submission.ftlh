<#ftl encoding='UTF-8'>
<#import "/spring.ftl" as spring/>
<!doctype html>
<html lang="ru">
<head>
    <#include "includes.ftlh"/>
    <title>ITSprint->Ваши посылки</title>
</head>
<body>
<#include "navBar.ftlh">
<form method="get" action="/submission/${submission.id}">
    <table class="table table-bordered table-hover table-responsive">
        <thead>
        <tr>
            <th>Дата</th>
            <th>Отправитель</th>
            <th>Язык</th>
            <th>Задача</th>
            <th>Вердикт</th>
            <th>Log</th>
        </tr>
        </thead>
        <tbody>
        <tr>
            <th>${submission.submissionTime}</th>
            <th><a href="/profile/${submission.owner.login}">${submission.owner.login}</a></th>
            <th>${submission.language.name}</th>
            <th>
                <a href="/contest/${submission.problem.contest.id}/problem/${submission.problem.shortName}">${submission.problem.contest.id}${submission.problem.shortName}
                    .${submission.problem.name}</a></th>
            <th>${submission.state.name()}</th>
            <th>${submission.log}</th>
        </tr>
        </tbody>
    </table>
</form>
</body>
</html>