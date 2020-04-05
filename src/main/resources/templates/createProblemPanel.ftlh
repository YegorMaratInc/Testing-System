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
<div>
    <form method="post" enctype="multipart/form-data" action="<@spring.url '/create/contest/${contestId}'/>">
        <div class="form-group">
            <label for="name">Название</label>
            <input autofocus class="form-control" id="name" name="name"
                   placeholder="Введите название здесь..." required>
        </div>
        <div class="form-group">
            <label for="shortName">Буква</label>
            <input autofocus class="form-control" id="shortName" name="shortName"
                   placeholder="Введите букву здесь..." required>
        </div>
        <div class="form-group">
            <label for="timeLimit">Ограничение по времени</label>
            <input autofocus class="form-control" id="timeLimit" name="timeLimit" type="number"
                   placeholder="1" required>
        </div>
        <div class="form-group">
            <label for="content">Условие</label>
            <textarea autofocus class="form-control" id="content" name="content" placeholder="Введите условие здесь..."
                      required></textarea>
        </div>
        <div class="form-group">
            <label for="inputFormat">Формат входа</label>
            <input autofocus class="form-control" id="inputFormat" name="inputFormat"
                   placeholder="Введите здесь..." required>
        </div>
        <div class="form-group">
            <label for="outputFormat">Формат выхода</label>
            <input autofocus class="form-control" id="outputFormat" name="outputFormat"
                   placeholder="Введите здесь..." required>
        </div>
        <div class="form-group">
            <label for="output">Выходные данные:
                <input type="file" name="output" multiple value>
            </label>
        </div>

        <button class="btn btn-success" type="submit">
            Создать
        </button>
    </form>
</div>
<#--TODO styles-->
</body>
</html>