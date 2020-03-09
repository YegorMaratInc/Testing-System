<#ftl encoding='UTF-8'>
<#import "/spring.ftl" as spring/>
<!doctype html>
<html lang="ru">
<head>
    <link href="<@spring.url '/css/bootstrap.min.css'/>" rel="stylesheet" type="text/css">
    <link href="<@spring.url '/css/style.css'/>" rel="stylesheet" type="text/css">
    <script src="<@spring.url '/js/jquery-3.4.1.min.js'/>"></script>
    <title>ITSprint-> Профиль ${user.login}</title>
</head>
<body>
<div>
    <table>
        <caption>Последние посылки</caption>
        <tr>
            <th>№</th>
            <th>Задача</th>
            <th>Язык</th>
            <th>Вердикт</th>
        </tr>
        <#list submissions as sub>
            <div id="submission">
                Последний непройденный тест: ${sub.lastTest}
            </div>
            <tr>
                <th>
                    <a href="/submission/${sub.id}">
                        ${sub.id}
                    </a>
                </th>
                <th>
                    <a href="/contest/${sub.problem.contest.id}/problem/${sub.problem.shortName}">${sub.problem.shortName}
                        - ${sub.problem.name}</a>
                </th>
                <th>${sub.language.name}</th>
                <th>${sub.state.name()} </th>
            </tr>

        </#list>
    </table>

</div>
</body>
</html>