<#ftl encoding='UTF-8'>
<#import "/spring.ftl" as spring/>
<!doctype html>
<html lang="ru">
<head>
    <link href="<@spring.url '/css/bootstrap.min.css'/>" rel="stylesheet" type="text/css">
    <link href="<@spring.url '/css/style.css'/>" rel="stylesheet" type="text/css">
    <script src="<@spring.url '/js/jquery-3.4.1.min.js'/>"></script>
    <title>ITSprint-></title>
</head>
<body>
<#include "navBar.ftlh">
<form method="post" action="<@spring.url '/edit/${user.login}'/>">
    <label for="userRole">Role:
        <#list roles as role>
            <div>
                <input type="radio" name="userRole"
                       value="${role}" ${user.userRole.toString()?contains(role)?string("checked", "")}>${role}
            </div>
        </#list>
    </label>
    <label for="userState">State:
        <#list states as state>
            <div>
                <input type="radio" name="userState"
                       value="${state}" ${user.userState.toString()?contains(state)?string("checked", "")}>${state}
            </div>
        </#list>
    </label>
    <div>
        <button class="btn btn-success" type="submit">
            Отправить
        </button>
    </div>
</form>

</body>
</html>