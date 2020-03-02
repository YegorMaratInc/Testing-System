<#ftl encoding='UTF-8'>
<#import "/spring.ftl" as spring/>
<!doctype html>
<html lang="ru">
<head>
    <link href="<@spring.url '/css/bootstrap.min.css'/>" rel="stylesheet" type="text/css">
    <link href="<@spring.url '/css/style.css'/>" rel="stylesheet" type="text/css">
    <script src="<@spring.url '/js/jquery-3.4.1.min.js'/>"></script>
    <title>ITSprint->Вход</title>
</head>
<body>
<div class="container-fluid">
    <div class="card">
        <div class="card-header">
            <div class="card-title h2">
                Войдите в систему ITSprint
            </div>
        </div>
        <div class="x-body">
            <#if error??>
                <div class="alert alert-danger" role="alert">
                    Логин или пароль введены неверно
                </div>
            </#if>
            <form method="post" action="<@spring.url '/login'/>">
                <div class="form-group">
                    <label for="login">Логин</label>
                    <input autofocus class="form-control" id="login" name="login"
                           placeholder="Введите логин здесь..." required>
                </div>
                <div class="form-group">
                    <label for="password">Пароль</label>
                    <input type="password" class="form-control" id="password" name="password"
                           placeholder="Введите пароль здесь..." required>
                </div>
                <div class="form-group form-check">
                    <input type="checkbox" class="form-check-input" id="remember-me" name="remember-me">
                    <label class="form-check-label" for="remember-me">Запомните меня!</label>
                </div>
                <div class="btn-group-vertical" role="group">
                    <button class="btn btn-success" type="submit">
                        Войти
                    </button>
                    <a class="btn btn-primary" role="button" href="<@spring.url '/signUp'/>">
                        Регистрация
                    </a>
                </div>
            </form>
        </div>
    </div>
</div>
</body>
</html>