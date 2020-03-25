<#ftl encoding='UTF-8'>
<#import "/spring.ftl" as spring/>
<!doctype html>
<html lang="ru">
<head>
    <link href="<@spring.url '/css/bootstrap.min.css'/>" rel="stylesheet" type="text/css">
    <link href="<@spring.url '/css/style.css'/>" rel="stylesheet" type="text/css">
    <script src="<@spring.url '/js/jquery-3.4.1.min.js'/>"></script>
    <title>ITSprint->Регистрация</title>
</head>
<body>
<div class="container">
    <div class="card">
        <div class="card-header">
            <div class="card-title h2">
                Регистрация в системе:
            </div>
        </div>
        <div class="card-body">
            <#if signupError??>
                <div class="alert alert-danger" role="alert">
                    ${alert}
                </div>
            </#if>
            <form method="post" action="<@spring.url '/signUp'/>">
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
                <div class="form-group">
                    <label for="firstName">Имя</label>
                    <input class="form-control" id="firstName" name="firstName"
                           placeholder="Введите своё имя здесь..." required>
                </div>
                <div class="form-group">
                    <label for="lastName">Фамилия</label>
                    <input class="form-control" id="lastName" name="lastName"
                           placeholder="Введите свою фамилию здесь..." required>
                </div>
                <button class="btn btn-success" type="submit">
                    Регистрация
                </button>
            </form>
        </div>
    </div>
</div>
</body>
</html>