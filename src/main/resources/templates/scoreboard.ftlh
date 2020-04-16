<#ftl encoding='UTF-8'>
<#import "/spring.ftl" as spring/>
<!doctype html>
<html lang="ru">
<head>
    <#include "includes.ftlh"/>
    <title>AlgoSprint->Результаты ${contest.title}</title>
</head>
<body>
<#include "navBar.ftlh">
<div class="container-fluid">
    <div class="card">
        <div class="card-header text-center">
            <div class="card-title h3">
                Таблица результатов
            </div>
        </div>
        <div class="card-body">
            <div class="card-text text-center">
                <table class="table table-bordered table-hover table-responsive-md">
                    <tr class="thead-dark">
                        <th>
                            Пользователь
                        </th>
                        <th>
                            Штраф
                        </th>
                        <#list problems as prob>
                            <th>
                                <a href="/contest/${prob.contest.id}/problem/${prob.shortName}">${prob.shortName}</a>
                            </th>
                        </#list>
                    </tr>
                    <#list scoreboard as score>
                        <tr>
                            <th><a href="/profile/${score.owner.login}">${score.owner.login}</a></th>
                            <th>${score.total}</th>
                            <#list score.problemDTO as pd>
                                <td>
                                    <#if pd.triesCount gt 0>
                                        <#if pd.solved == true>
                                            <span class="text-success">
                                            +<#if pd.triesCount gt 1>${pd.triesCount - 1}</#if>
                                            </span>
                                            <br>
                                            <span>
                                                ${pd.timeAdded}
                                            </span>
                                        <#else>
                                            <span class="text-danger">
                                            -${pd.triesCount}
                                            </span>
                                        </#if>
                                    <#else>
                                        -
                                    </#if>
                                </td>
                            </#list>
                        </tr>
                    </#list>
                </table>
            </div>
        </div>
    </div>
</div>
</body>
</html>