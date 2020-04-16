<#ftl encoding='UTF-8'>
<#import "/spring.ftl" as spring/>
<!doctype html>
<html lang="ru">
<head>
    <#include "includes.ftlh"/>
    <title>AlgoSprint->Ответ на вопрос</title>
</head>
<body>
<#include "navBar.ftlh">
<div class="container">
    <div class="card">
        <form method="post" action="<@spring.url '/reply/${question.id}'/>">
            <div class="card-header">
                <h3>Вопрос</h3>
            </div>
            <div class="card-body">
                <div class="form-group">
                    <label for="answer">
                        ${question.question}
                    </label>
                    <textarea name="answer" required id="answer" class="form-control" placeholder="Ответ..."
                              autofocus></textarea>
                </div>
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