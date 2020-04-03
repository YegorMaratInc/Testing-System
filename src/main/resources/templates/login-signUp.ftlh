<#ftl encoding='UTF-8'>
<#import "/spring.ftl" as spring/>
<!DOCTYPE html>
<html lang="ru">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <#include "includes.ftlh"/>
    <title>ITSprint->Активные контесты</title>
</head>
<body>
<div class="container">
    <div class="card mt-5">
        <div class="card-header">
            <div class="card-header-tabs">
                <ul class="nav nav-tabs" role="tablist">
                    <li class="nav-item">
                        <a class="nav-link active" id="aTab" href="#sectionA" data-toggle="tab" role="tab"
                           aria-controls="sectionA" aria-selected="true">Войти</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" id="bTab" href="#sectionB" data-toggle="tab" role="tab"
                           aria-controls="sectionB"
                           aria-selected="false">Регистрация</a>
                    </li>
                </ul>
            </div>
        </div>
        <div class="card-body">
            <div class="tab-content">
                <div id="sectionA" class="tab-pane fade show active" role="tabpanel" aria-labelledby="aTab">
                    <div>
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
                                <input type="checkbox" class="form-check-input" id="remember-me"
                                       name="remember-me">
                                <label class="form-check-label" for="remember-me">Запомните меня!</label>
                            </div>
                            <div class="btn-group-vertical" role="group">
                                <button class="btn btn-dark" type="submit">
                                    Войти
                                </button>
                            </div>
                        </form>
                    </div>
                </div>
                <div id="sectionB" class="tab-pane fade" role="tabpanel" aria-labelledby="bTab">
                    <div>
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
                            <button class="btn btn-dark" type="submit">
                                Регистрация
                            </button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>