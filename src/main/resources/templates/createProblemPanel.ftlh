<#ftl encoding='UTF-8'>
<#import "/spring.ftl" as spring/>
<!doctype html>
<html lang="ru">
<head>
    <#include "includes.ftlh"/>
    <title>ITSprint->Создать задачу</title>
</head>
<body>
<#include "navBar.ftlh">
<div class="container">
    <div class="card">
        <div class="card-header"><h3>Создать задачу</h3></div>

        <form method="post" enctype="multipart/form-data" action="<@spring.url '/create/contest/${contestId}'/>">
            <div class="card-body">
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
                    <input autofocus class="form-control" id="timeLimit" name="timeLimit" type="number" required>
                </div>
                <div class="form-group">
                    <label for="content">Условие</label>
                    <textarea autofocus class="form-control" id="content" name="content"
                              placeholder="Введите условие здесь..."
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
                    <label for="example">Пример</label>
                    <input autofocus class="form-control" id="example" name="example"
                           placeholder="Введите здесь..." required>
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