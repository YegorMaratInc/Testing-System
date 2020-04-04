<#ftl encoding='UTF-8'>
<#import "/spring.ftl" as spring/>
<!doctype html>
<html lang="ru">
<head>
    <#include "includes.ftlh"/>
    <title>ITSprint->Отправка решения</title>
</head>
<body>
<#include "navBar.ftlh">
<div>
    <form method="post" enctype="multipart/form-data" action="<@spring.url '/submit/contest/${contest.id}'/>">
        <label for="languageName">Language:
            <select id="languageName" name="languageName">

                <#list languages as lang>
                    <option value="${lang.name}">${lang.name}</option>
                </#list>

            </select>
        </label>
        <label for="problem">Problem:
            <select id="problem" name="problem">
                <option>Select problem</option>
                <#list problems as prob>
                    <option value="${prob.id}">${prob.name}</option>
                </#list>
            </select>

        </label>
        <label for="program">Program:
            <input type="file" name="program" value required>
        </label>
        <button class="btn btn-success" type="submit">
            Отправить
        </button>
        <h6>Егор, преврати это в конфетку</h6>
    </form>
</div>
<#--TODO apply style and edit form properly-->
</body>
</html>