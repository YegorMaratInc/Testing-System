<#ftl encoding='UTF-8'>
<#import "/spring.ftl" as spring/>
<!doctype html>
<html lang="ru">
<head>
    <#include "includes.ftlh"/>
    <title>ITSprint->Создать</title>
</head>
<body>
<#include "navBar.ftlh">
<form method="post" action="<@spring.url '/create'/>">
    <div class="form-group">
        <label for="title">Название</label>
        <input autofocus class="form-control" id="title" name="title"
               placeholder="Введите название здесь..." required>
    </div>
    <div class="form-group">
        <label for="startTime">Начало</label>
        <input autofocus class="form-control" id="startTime" name="startTime"
               type="datetime-local" required><#--work on it-->
    </div>
    <div class="form-group">
        <label for="finishTime">Конец</label>
        <input autofocus class="form-control" id="finishTime" name="finishTime"
               type="datetime-local" required><#--work on it-->
    </div>
    <button class="btn btn-success" type="submit">
        Создать
    </button>
</form>
<#--TODO styles-->
</body>
</html>