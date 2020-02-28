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