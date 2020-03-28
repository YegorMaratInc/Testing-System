<#ftl encoding='UTF-8'>
<#import "/spring.ftl" as spring/>
<!doctype html>
<html lang="ru">
<head>
    <link href="<@spring.url '/css/bootstrap.min.css'/>" rel="stylesheet" type="text/css">
    <link href="<@spring.url '/css/style.css'/>" rel="stylesheet" type="text/css">
    <script src="<@spring.url '/js/jquery-3.4.1.min.js'/>"></script>
    <title>ITSprint->Результаты</title>
    <style>
        .cell-up {
            color: green;
            font-weight: bold;
            font-size: 13px;
        }

        .cell-down {
            display: block;
            font-size: 13px;
        }
    </style>
</head>
<body>
<#include "navBar.ftlh">
<#--TODO generate resultsTable-->
<div style="margin: 2%">
    <div class="card">
        <div class="card-header">
            <div class="card-title">
                <h3>
                    Таблица резултатов
                </h3>
            </div>
        </div>
        <div class="card-body">
            <div class="card-text text-center">
                <table class="table table-bordered table-hover">
                    <tr class="thead-dark">
                        <th>
                            Хто
                        </th>
                        <th>
                            =
                        </th>
                        <#list problems as prob>
                            <th>
                                ${prob.shortName}
                            </th>
                        </#list>
                    </tr>
                    <#list scoreboard as user, score>
                        <tr>
                            <th><a href="/profile/${user.login}">${user.login}</a></th>
                            <th><span id="count${user.login}"></span></th>
                            <script type="text/javascript">
                                function f() {
                                    let count = 0;
                                    <#list score as score>
                                    if (${score.solved?string("true", "false")})
                                        count++;
                                    </#list>
                                    if (count > 0)
                                        $('#count${user.login}').text(count);
                                }

                                f();
                            </script>
                            <#list score as score>
                                <th>
                                    <span id="cell-up${user.login}${score.problemShortName}"
                                          style="font-size: 13px"></span>
                                    <span id="cell-down${user.login}${score.problemShortName}"></span>
                                    <script type="text/javascript">
                                        function fun() {
                                            let score = $('#cell-up${user.login}${score.problemShortName}');
                                            let time = $('#cell-down${user.login}${score.problemShortName}');
                                            let triesCount = ${score.triesCount};
                                            let solved = ${score.solved?string("true", "false")};
                                            let text = "";
                                            if (solved) {
                                                let timeAdded = #{score.timeAdded};
                                                let hours = Math.floor(timeAdded / 60);
                                                let minutes = timeAdded % 60;
                                                let tt;
                                                if (hours < 9)
                                                    if (minutes < 9)
                                                        tt = "0" + hours + ":0" + minutes;
                                                    else
                                                        tt = "0" + hours + ":" + minutes;
                                                else if (minutes < 9)
                                                    tt = hours + ":0" + minutes;
                                                else
                                                    tt = hours + ":" + minutes;
                                                score.addClass("cell-up");
                                                time.addClass("cell-down");
                                                time.text(tt);
                                                if (triesCount > 1)
                                                    text = "+" + String(triesCount);
                                                else
                                                    text = "+";
                                            } else {
                                                if (triesCount > 0)
                                                    text = "-" + triesCount;
                                            }
                                            score.text(text);
                                        }

                                        fun();
                                    </script>
                                </th>
                            </#list>
                        </tr>
                    </#list>
                </table>
            </div>
        </div>
    </div>
</div>
</body>
</html>