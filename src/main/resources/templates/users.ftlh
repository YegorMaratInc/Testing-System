<#ftl encoding='UTF-8'>
<#-- @ftlvariable name="users" type="java.util.List<ru.licpnz.testingsystem.models.User>" -->
<#import "/spring.ftl" as spring/>
<!doctype html>
<html lang="ru">
<head>
    <#include "includes.ftlh"/>
    <title>AlgoSprint->Пользователи</title>
</head>
<body>
<#include "navBar.ftlh">
<div class="container">
    <div class="card">
        <div class="card-header">
            <div class="card-title">
                <h3>
                    Зарегистрированные пользователи
                </h3>
            </div>

        </div>
        <div class="card-body">
            <table class="table table-bordered table-hover table-responsive-md">
                <tr class="thead-dark">
                    <th>
                        Имя пользователя
                    </th>
                    <th>
                        Фамилия
                    </th>
                    <th>
                        Имя
                    </th>
                    <th>
                        Роль
                    </th>
                    <th>
                        Состояние
                    </th>
                    <th>
                        Редактировать
                    </th>
                </tr>
                <#list users as user>
                    <tr>
                        <td>${user.login}</td>
                        <td>${user.firstName}</td>
                        <td>${user.lastName}</td>
                        <td>
                            <select id="selectRole${user.login}">
                                <#list roles as role>
                                    <option <#if user.userRole == role.name() >selected</#if>>${role.name()}</option>
                                </#list>
                            </select>
                            <label for="selectRole${user.login}"></label>
                        </td>
                        <td>
                            <select id="selectState${user.login}">
                                <#list states as state>
                                    <option <#if user.userState == state.name() >selected</#if>>${state.name()}</option>
                                </#list>
                            </select>
                            <label for="selectState${user.login}"></label>
                        </td>
                        <td>
                            <button class="btn btn-outline-dark myBtn" type="submit" onclick="
                                    let jsonData = JSON.stringify({'userRole': $('#selectRole${user.login}').val(), 'userState': $('#selectState${user.login}').val(), 'user': ${user.id}});
                                    $.ajax({
                                    url:'<@spring.url '/users' />',
                                    type: 'POST',
                                    contentType: 'application/json',
                                    data: jsonData
                                    });">Зафиксировать
                            </button>
                        </td>
                    </tr>
                </#list>
            </table>
        </div>
    </div>
</div>
</body>
</html>