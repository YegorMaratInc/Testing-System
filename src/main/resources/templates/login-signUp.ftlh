<#ftl encoding='UTF-8'>
<#import "/spring.ftl" as spring/>
<!DOCTYPE html>
<html lang="ru">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <#include "includes.ftlh"/>
    <title>ITSprint->Регистрация</title>
</head>
<body class="signUp-login">
<div class="container">
    <div class="row justify-content-center">
        <div class="col-8">
            <div class="card mt-5 border-dark">
                <div class="card-header orangeCardHeader">
                    <div class="card-header-tabs">
                        <ul class="nav nav-tabs" role="tablist">
                            <li class="nav-item">
                                <a class="nav-link headerLink <#if signupError??><#else>active</#if>" id="aTab"
                                   href="#sectionA"
                                   data-toggle="tab" role="tab"
                                   aria-controls="sectionA"
                                   <#if signupError??>aria-selected="false"<#else> aria-selected="true"</#if> >Войти</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link headerLink <#if signupError??>active</#if>" id="bTab"
                                   href="#sectionB"
                                   data-toggle="tab"
                                   role="tab"
                                   <#if signupError??>aria-selected="true"<#else> aria-selected="false"</#if>>Регистрация</a>
                            </li>
                        </ul>
                    </div>
                </div>
                <div class="card-body">
                    <div class="tab-content">
                        <div id="sectionA" class="tab-pane fade <#if signupError??><#else>show active</#if>"
                             role="tabpanel"
                             aria-labelledby="aTab">
                            <div>
                                <form method="post" action="/login">
                                    <#if error??>
                                        <div class="alert alert-danger alert-dismissible" role="alert">
                                            Имя пользователя или пароль введены неправильно
                                        </div>
                                    </#if>
                                    <div class="form-group">
                                        <label for="inputLogin">Логин</label>
                                        <input autofocus="" class="form-control" id="inputLogin" name="login"
                                               required="" placeholder="Введите логин здесь...">
                                    </div>
                                    <div class="form-group">
                                        <label for="inputPassword">Пароль</label>
                                        <input type="password" class="form-control" id="inputPassword" name="password"
                                               placeholder="Введите пароль здесь..." required="">
                                    </div>
                                    <div class="form-group form-check">
                                        <input type="checkbox" class="form-check-input" id="remember-me"
                                               name="remember-me">
                                        <label class="form-check-label" for="remember-me">Запомните меня!</label>
                                    </div>
                                    <div class="btn-group-vertical" role="group">
                                        <button class="btn btn-outline-dark myBtn" type="submit">
                                            Войти
                                        </button>
                                    </div>
                                </form>
                            </div>
                        </div>
                        <div id="sectionB" class="tab-pane fade<#if signupError??>show active</#if>" role="tabpanel"
                             aria-labelledby="bTab">
                            <div>
                                <form method="post" action="/signUp">
                                    <#if signupError??>
                                        <div class="alert alert-danger alert-dismissible" role="alert">${alert}</div>
                                    </#if>
                                    <div class="form-group">
                                        <label for="login">Логин</label>
                                        <input autofocus="" class="form-control" id="login" name="login"
                                               placeholder="Введите логин здесь..." required="">
                                    </div>
                                    <div class="form-group">
                                        <label for="password">Пароль</label>
                                        <input type="password" class="form-control" id="password" name="password"
                                               placeholder="Введите пароль здесь..." required="">
                                    </div>
                                    <div class="form-group">
                                        <label for="firstName">Имя</label>
                                        <input class="form-control" id="firstName" name="firstName"
                                               placeholder="Введите своё имя здесь..." required="">
                                    </div>
                                    <div class="form-group">
                                        <label for="lastName">Фамилия</label>
                                        <input class="form-control" id="lastName" name="lastName"
                                               placeholder="Введите свою фамилию здесь..." required="">
                                    </div>
                                    <button class="btn btn-outline-dark myBtn" type="submit">
                                        Регистрация
                                    </button>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>