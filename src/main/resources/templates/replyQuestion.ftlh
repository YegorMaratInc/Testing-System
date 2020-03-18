<#ftl encoding='UTF-8'>
<#import "/spring.ftl" as spring/>
<!doctype html>
<html lang="ru">
<head>
    <link href="<@spring.url '/css/bootstrap.min.css'/>" rel="stylesheet" type="text/css">
    <link href="<@spring.url '/css/style.css'/>" rel="stylesheet" type="text/css">
    <script src="<@spring.url '/js/jquery-3.4.1.min.js'/>"></script>
    <title>ITSprint->Вопрос жюри</title>
</head>
<body>
<#include "navBar.ftlh">
<#--TODO make form and apply style-->
<div>
    <form method="post" action="<@spring.url '/reply/${question.id}'/>">
        <div class="form-group">
            <h4>Вопрос</h4>
            <span>${question.question}</span>
        </div>
        <div>
            <label for="answer">
                <textarea name="answer" required id="answer" class="form-control" placeholder="Ответ..." autofocus>
                </textarea>
            </label>
        </div>
        <button class="btn btn-success" type="submit">
            Отправить
        </button>
    </form>
</div>
</body>
</html>