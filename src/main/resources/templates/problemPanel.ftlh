<#ftl encoding='UTF-8'>
<#import "/spring.ftl" as spring/>
<!doctype html>
<html lang="ru">
<head>
    <link href="<@spring.url '/css/bootstrap.min.css'/>" rel="stylesheet" type="text/css">
    <link href="<@spring.url '/css/style.css'/>" rel="stylesheet" type="text/css">
    <script src="<@spring.url '/js/jquery-3.4.1.min.js'/>"></script>
    <title>ITSprint->Проблемы контеста ${contest.title}</title>
</head>
<body>
<table class="table">
    <caption>Задачи</caption>
    <tr>
        <th>ID</th>
        <th>Name</th>
    </tr>
    <#list problems as problem>
        <tr>
            <th>${problem.id}</th>
            <th><a href="/contest/${contest.id}/problem/${problem.shortName}">${problem.shortName}.${problem.name}</a>
            </th>
        </tr>
    </#list>
</table>
<#--TODO fix style and order problems-->
<div>
    <#if role == true>
        <a href="/create/contest/${contest.id}">Create Problem</a>
    </#if>
</div>
</body>
</html>