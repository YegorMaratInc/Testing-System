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
<form method="get" action="/submissions/contest/${contestId}">
    <#include "navBar.ftlh">
    Yes.
    <table>
        <caption></caption>
        <tr>
            <th>id</th>
            <th>Время</th>
            <th></th>
        </tr>
        <#list submissions as sub>
            <tr>
                <th></th>
            </tr>
        </#list>
    </table>
</form>
<#--TODO make table with your submissions-->
</body>
</html>