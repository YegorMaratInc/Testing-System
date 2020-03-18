<#import "/spring.ftl" as spring>
<#--<#if role == true>-->
<nav class="navbar navbar-expand-sm bg-light navbar-light">
    <a class="navbar-brand" href="<@spring.url '/'/>">
        <img src="<@spring.url '/images/logo-removebg-preview.png'/>" width="56" height="56 "
             class="d-inline-block align-top" alt="">
    </a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent"
            aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>

    <div class="collapse navbar-collapse" id="navbarSupportedContent">
        <ul class="navbar-nav mr-auto"><#--
                <li class="nav-item active">
                    <a class="nav-link" href="<@spring.url '/profile/${login}'/>">Профиль<span
                                class="sr-only">(current)</span></a>
                </li>-->
            <li class="nav-item">
                <a class="nav-link" href="<@spring.url '/users'/>">Список пользователей</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="<@spring.url '/contestPanel'/>">Соревнования</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="<@spring.url '/create'/>">Создать контест</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="<@spring.url '/logout'/>">Выйти из аккаунта</a>
            </li>
        </ul>
    </div>
</nav><#--
</#if>
<#if role == false>
    <nav class="navbar navbar-expand-lg navbar-dark bg-primary">
        <a class="navbar-brand" href="<@spring.url '/'/>">
            <img src="<@spring.url '/images/logo-removebg-preview.png'/>" width="56" height="56 "
                 class="d-inline-block align-top" alt="">
        </a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent"
                aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav mr-auto">
                <li class="nav-item">
                    <a class="nav-link" href="<@spring.url '/contestPanel'/>">Соревнования</a>
                </li>
                <li class="nav-item active">
                    <a class="nav-link" href="<@spring.url '/profile/${login}'/>">Профиль<span
                                class="sr-only">(current)</span></a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="<@spring.url '/logout'/>">Выйти из аккаунта</a>
                </li>
            </ul>
        </div>
    </nav>
</#if>