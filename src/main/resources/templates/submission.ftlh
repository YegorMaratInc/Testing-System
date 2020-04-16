<#ftl encoding='UTF-8'>
<#import "/spring.ftl" as spring/>
<!doctype html>
<html lang="ru">
<head>
    <#include "includes.ftlh"/>
    <title>AlgoSprint->#${submission.id}</title>
</head>
<body>
<#include "navBar.ftlh">
<div class="container">
    <div class="card">
        <div class="card-header text-center">
            <div class="card-title h3">
                Посылка ${submission.id}
            </div>
        </div>
        <div class="card-body">
            <table class="table table-bordered table-hover table-responsive-md">
                <thead>
                <tr>
                    <th>Дата</th>
                    <th>Отправитель</th>
                    <th>Язык</th>
                    <th>Задача</th>
                    <th>Вердикт</th>
                    <th>Тест №</th>
                    <th>Логи</th>
                </tr>
                </thead>
                <tbody>
                <tr>
                    <td>${submission.submissionTime}</td>
                    <td><a href="/profile/${submission.owner.login}">${submission.owner.login}</a></td>
                    <td>${submission.language.name}</td>
                    <td>
                        <a href="/contest/${submission.problem.contest.id}/problem/${submission.problem.shortName}">${submission.problem.contest.id}${submission.problem.shortName}
                            .${submission.problem.name}</a></td>
                    <td>${submission.state.name()}</td>
                    <td>${submission.lastTest}</td>
                    <td>${submission.log}</td>
                </tr>
                </tbody>
            </table>
        </div>
    </div>
</div>
</body>
</html>