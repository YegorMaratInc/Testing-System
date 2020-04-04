<#ftl encoding='UTF-8'>
<#import "/spring.ftl" as spring/>
<!doctype html>
<html lang="ru">
<head>
    <#include "includes.ftlh"/>
    <title>ITSprint->Вопрос жюри</title>
</head>
<body>
<#include "navBar.ftlh">
<#--TODO make form and apply style-->
<div>
    <form method="post" action="<@spring.url '/question/${problemId}'/>">
        <div class="form-group">
            <label for="question">Вопрос</label>
            <textarea autofocus class="form-control" id="question" name="question"
                      placeholder="Введите вопрос здесь..." required>
            </textarea>
        </div>
        <button class="btn btn-success" type="submit">
            Отправить
        </button>
    </form>
</div>
</body>
</html>