<#ftl encoding='UTF-8'>
<#import "/spring.ftl" as spring/>
<!doctype html>
<html lang="ru">
<head>
    <link href="<@spring.url '/css/bootstrap.min.css'/>" rel="stylesheet" type="text/css">
    <link href="<@spring.url '/css/style.css'/>" rel="stylesheet" type="text/css">
    <script src="<@spring.url '/js/jquery-3.4.1.min.js'/>"></script>
    <title>ITSprint->Все проблемы</title>
</head>
<body>
<#include "navBar.ftlh">
<div class="container">
    <div class="card">
        <div class="card-header">
            <div class="card-title">
                <h3>
                    Задачи
                </h3>
            </div>

        </div>
        <div class="card-body">
            <div class="card-text text-center">
                <table class="table table-bordered table-hover">
                    <tr class="thead-dark">
                        <th>№</th>
                        <th>Name</th>
                        <th>Time limit</th>
                    </tr>
                    <#list problems as problem>
                        <tr>
                            <th>
                                <a href="/contest/${problem.contest.id}/problem/${problem.shortName}">${problem.contest.id}${problem.shortName}</a>
                            </th>
                            <th>
                                <a href="/contest/${problem.contest.id}/problem/${problem.shortName}">${problem.name}</a>
                            </th>
                            <th>${problem.timeLimit} sec</th>
                        </tr>
                    </#list>
                </table>
            </div>
        </div>
    </div>
</div>
</body>
</html>