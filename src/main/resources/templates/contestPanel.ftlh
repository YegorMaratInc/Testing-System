<#ftl encoding='UTF-8'>
<#import "/spring.ftl" as spring/>
<!doctype html>
<html lang="ru">
<head>
    <link href="<@spring.url '/css/bootstrap.min.css'/>" rel="stylesheet" type="text/css">
    <link href="<@spring.url '/css/style.css'/>" rel="stylesheet" type="text/css">
    <script src="<@spring.url '/js/jquery-3.4.1.min.js'/>"></script>
    <title>ITSprint->Контест</title>
</head>
<body>
<form method="get" action="<@spring.url '/contestPanel'/>">
    <#include "navBar.ftlh">
    <table>
        <caption></caption>
        <tr>
            <th>Контест</th>
            <th>Время начала</th>
            <th>Время конца</th>
        </tr>
        <#list contests as contest>
            <tr>
                <th>${contest.title}</th>
                <th>${contest.startTime}</th>
                <th>${contest.finishTime}</th>
            </tr>
        </#list>
    </table>
</form>
<#--TODO fix style and order problems-->
</body>
</html>