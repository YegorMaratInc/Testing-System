<#ftl encoding='UTF-8'>
<#import "/spring.ftl" as spring/>
<!doctype html>
<html lang="ru">
<head>
    <#include "includes.ftlh"/>
    <title>ITSprint->Отправка решения</title>
</head>
<body>
<#include "navBar.ftlh">
<div class="container">
    <div class="row justify-content-center">
        <div class="col-8">
            <div class="card">
                <div class="card-header">
                    <h4 class="card-title">
                        Сдать задачу
                    </h4>
                    <h5 class="card-subtitle">
                        Контест ${contest.title}
                    </h5>
                </div>
                <div class="card-body">
                    <form method="post" enctype="multipart/form-data"
                          action="<@spring.url '/submit/contest/${contest.id}'/>">
                        <div class="form-row">
                            <div class="form-group col-md-6 col-xl-4">
                                <label for="languageName">Язык программирования
                                    <select class="form-control" id="languageName" name="languageName">
                                        <#list languages as lang>
                                            <option value="${lang.name}" <#if lastLanguage.equals(lang)>selected</#if>>
                                                ${lang.name}
                                            </option>
                                        </#list>
                                    </select>
                                </label>
                            </div>
                            <div class="form-group col-md-6 col-xl-4">
                                <label for="problem">Задача
                                    <select class="form-control" id="problem" name="problem">
                                        <option>Select problem</option>
                                        <#list problems as prob>
                                            <option value="${prob.id}"
                                                    <#if preferred?? && prob.id == preferred>selected</#if>>
                                                ${prob.name}
                                            </option>
                                        </#list>
                                    </select>
                                </label>
                            </div>
                            <div class="form-group col-md-12 col-xl-4">
                                <label for="program">Исходный код
                                    <input class="form-control-file" id="program" type="file" name="program" required>
                                </label>
                            </div>
                        </div>
                        <button class="btn btn-outline-dark myBtn" type="submit">
                            Отправить
                        </button>

                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>