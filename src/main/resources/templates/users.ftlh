<#ftl encoding='UTF-8'>
<#-- @ftlvariable name="users" type="java.util.List<ru.licpnz.testingsystem.models.User>" -->
<#import "/spring.ftl" as spring/>
<!doctype html>
<html lang="ru">
<head>
    <link href="<@spring.url '/css/bootstrap.min.css'/>" rel="stylesheet" type="text/css">
    <link href="<@spring.url '/css/style.css'/>" rel="stylesheet" type="text/css">
    <script src="<@spring.url '/js/jquery-3.4.1.min.js'/>"></script>
    <title>ITSprint->Пользователи</title>
</head>
<body>
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
            <div class="card-text text-center">
                <table class="table table-bordered table-hover">
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
                    </tr>
                    <#list users as user>
                        <tr>
                            <td>${user.login}</td>
                            <td>${user.firstName}</td>
                            <td>${user.lastName}</td>
                            <td>${user.userRole}</td>
                        </tr>
                    </#list>
                </table>
            </div>
        </div>
    </div>
</div>
</body>
</html>
