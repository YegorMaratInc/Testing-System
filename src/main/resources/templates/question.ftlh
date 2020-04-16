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
<div class="container">
    <div class="card">
        <form method="post" action="<@spring.url '/question/${problemId}'/>">
            <div class="card-header">
                <h3><label for="question">Вопрос</label></h3>
            </div>
            <div class="card-body">
                <textarea autofocus class="form-control" id="question" name="question"
                          placeholder="Введите вопрос здесь..." required></textarea>
            </div>
            <div class="card-footer">
                <button class="btn btn-outline-dark myBtn" type="submit">
                    Отправить
                </button>
            </div>
        </form>
    </div>
</div>
</body>
</html>