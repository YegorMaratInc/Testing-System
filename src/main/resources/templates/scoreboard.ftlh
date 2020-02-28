<#ftl encoding='UTF-8'>
<#import "/spring.ftl" as spring/>
<!doctype html>
<html lang="ru">
<head>
    <link href="<@spring.url '/css/bootstrap.min.css'/>" rel="stylesheet" type="text/css">
    <link href="<@spring.url '/css/style.css'/>" rel="stylesheet" type="text/css">
    <script src="<@spring.url '/js/jquery-3.4.1.min.js'/>"></script>
    <title>ITSprint->Результаты</title>
</head>
<body>
<#--TODO generate resultsTable-->
<form method="get" action="<@spring.url '/scoreboard/${contest.id}'/>">
    <#list scoreboard as user, score>
        <h6>${user.login}
            <#list score as score>
                ${score.triesCount}
            </#list>
        </h6>
    </#list>

</form>
</body>
</html>