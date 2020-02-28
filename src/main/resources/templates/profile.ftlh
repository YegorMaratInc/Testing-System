<#ftl encoding='UTF-8'>
<#import "/spring.ftl" as spring/>
<!doctype html>
<html lang="ru">
<head>
    <link href="<@spring.url '/css/bootstrap.min.css'/>" rel="stylesheet" type="text/css">
    <link href="<@spring.url '/css/style.css'/>" rel="stylesheet" type="text/css">
    <script src="<@spring.url '/js/jquery-3.4.1.min.js'/>"></script>
    <title>ITSprint-> Профиль ${user.login}</title>
    <style>
        #submission {
            width: 300px;
            height: 50px;
            text-align: center;
            padding: 15px;
            border: 3px solid #0000cc;
            border-radius: 10px;
            color: #0000cc;
            position: absolute;
            top: 0;
            right: 0;
            bottom: 0;
            left: 0;
            margin: auto;
        }

        #submission:target {
            display: block;
        }
    </style>
</head>
<body>
<div>
    <table>
        <caption>Последние посылки</caption>
        <tr>
            <th>№</th>
            <th>Задача</th>
            <th>Язык</th>
            <th>Вердикт</th>
        </tr>
        <#list submissions as sub>
            <div id="submission">
                Последний непройденный тест: ${sub.lastTest}
            </div>
            <tr>
                <th>
                    <a href="#submission">
                        ${sub.id}
                    </a>
                </th>
                <th>
                    <a href="/contest/${sub.problem.contest.id}/problem/${sub.problem.shortName}">${sub.problem.shortName}
                        - ${sub.problem.name}</a>
                </th>
                <th>${sub.language.name}</th>
                <th>${sub.state.name()} </th>
            </tr>

        </#list>
    </table>

</div>
</body>
</html>