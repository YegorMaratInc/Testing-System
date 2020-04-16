<#ftl encoding='UTF-8'>
<#import "/spring.ftl" as spring/>
<!doctype html>
<html lang="ru">
<head>
    <#include "includes.ftlh"/>
    <title>ITSprint-></title>
</head>
<body>
<#include "navBar.ftlh">
<div class="container">
    <div class="card w-50">
        <div class="card-header text-center">
            <div class="card-title h2">
                Зарегистрировать нового пользователя
            </div>
        </div>
        <div class="card-body">
            <#if signupError??>
                <div class="alert alert-danger" role="alert">
                    ${alert}
                </div>
            </#if>
            <form method="post" action="/createGhost">
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
                           placeholder="Введите имя здесь..." required>
                </div>
                <div class="form-group">
                    <label for="lastName">Фамилия</label>
                    <input class="form-control" id="lastName" name="lastName"
                           placeholder="Введите фамилию здесь..." required>
                </div>
                <div class="text-center">
                    <button class="btn btn-outline-dark myBtn bt-lg" type="submit">
                        Регистрация
                    </button>
                </div>
            </form>
        </div>
    </div>
</div>
</body>
</html>