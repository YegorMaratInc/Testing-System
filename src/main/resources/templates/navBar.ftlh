<#import "/spring.ftl" as spring>
<nav class="navbar navbar-light navbar-expand-md  navbar-red mb-3 sticky-top">
    <a class="navbar-brand" href="<@spring.url '/'/>">
        <img src="<@spring.url '/images/logo-removebg-preview.png'/>" width="56" height="56"
             class="d-inline-block align-top" alt="">AlgoSprint</a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbar"
            aria-controls="navbar" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>

    <div class="collapse navbar-collapse" id="navbar">
        <ul class="navbar-nav mr-auto">
            <li class="nav-item">
                <a class="nav-link" href="<@spring.url '/profile/'/>">
                    Профиль
                </a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="<@spring.url '/contestPanel'/>">Соревнования</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="<@spring.url '/problemPanel'/>">Архив</a>
            </li>
        </ul>
        <form class="form-inline" method="get" action="<@spring.url '/logout'/>">
            <button class="btn btn-outline-dark myBtn" role="button" type="submit">
                Выйти из аккаунта
            </button>
        </form>
    </div>
</nav>