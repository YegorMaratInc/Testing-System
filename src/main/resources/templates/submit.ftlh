<#ftl encoding='UTF-8'>
<#import "/spring.ftl" as spring/>
<!doctype html>
<html lang="ru">
<head>
    <link href="<@spring.url '/css/bootstrap.min.css'/>" rel="stylesheet" type="text/css">
    <link href="<@spring.url '/css/style.css'/>" rel="stylesheet" type="text/css">
    <script src="<@spring.url '/js/jquery-3.4.1.min.js'/>"></script>
    <title>ITSprint->Отправка решения</title>
</head>
<body>
<form>
    <label>Language:
        <select>
            <option>Select language</option>
            <#list languages as lang>
                <option value="${lang.id}">${lang.name}</option>
            </#list>

        </select>
    </label>
    <label>Problem:
        <select>
            <option>Select problem</option>
            <#list problems as problem>
                <option value="${problem.id}">${problem.name}</option>
            </#list>
        </select>

    </label>
</form>
<#--TODO apply style and edit form properly-->
</body>
</html>