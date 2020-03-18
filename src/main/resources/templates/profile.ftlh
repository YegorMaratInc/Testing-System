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
<div class="container">
    <div class="card">
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
                    <tr class="thead-dark">
                        <th>№</th>
                        <th>Дата</th>
                        <th>Задача</th>
                        <th>Язык</th>
                        <th>Вердикт</th>
                        <th>Last test</th>
                        <th>Log</th>
                    </tr>
                    <#list submissions as sub>
                        <tr>
                            <th><a href="/submission/${sub.id}">${sub.id}</a></th>
                            <th>${sub.submissionTime}</th>

                            <th>
                                <a href="/contest/${sub.problem.contest.id}/problem/${sub.problem.shortName}">${sub.problem.shortName}
                                    - ${sub.problem.name}</a></th>
                            <th>${sub.language.name}</th>
                            <th>${sub.state.name()} </th>
                            <th>${sub.lastTest}</th>
                            <th>${sub.log}</th>
                        </tr>
                    </#list>
                </table>
            </div>
        </div>
    </div>
</div>
</body>
</html>