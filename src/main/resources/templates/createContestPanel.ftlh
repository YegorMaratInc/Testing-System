<#ftl encoding='UTF-8'>
<#import "/spring.ftl" as spring/>
<!doctype html>
<html lang="ru">
<head>
    <#include "includes.ftlh"/>
    <title>ITSprint->Создать контест</title>
</head>
<body>
<#include "navBar.ftlh">
<div class="container">
    <div class="card">
        <form method="post" action="<@spring.url '/create'/>">
            <div class="card-header"><h3>Создать контест</h3></div>
            <div class="card-body">
                <div class="form-group">
                    <label for="title">Название</label>
                    <input autofocus class="form-control" id="title" name="title"
                           placeholder="Введите название здесь..." required>
                </div>
                <div class="form-group">
                    <label for="startTime">Начало</label>
                    <input autofocus class="form-control" id="startTime" name="startTime"
                           type="datetime-local" required>
                </div>
                <div class="form-group">
                    <label for="finishTime">Конец</label>
                    <input autofocus class="form-control" id="finishTime" name="finishTime"
                           type="datetime-local" required>
                </div>
            </div>
            <div class="card-footer">
                <button class="btn btn-success" type="submit">
                    Создать
                </button>
            </div>
        </form>
    </div>
</div>
</body>
</html>