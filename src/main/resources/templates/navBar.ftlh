<#import "/spring.ftl" as spring>
<nav class="navbar navbar-expand-lg navbar-dark bg-my mb-3">
    <a class="navbar-brand" href="<@spring.url '/'/>">
        <img src="<@spring.url '/images/logo-removebg-preview.png'/>" width="56" height="56 "
             class="d-inline-block align-top" alt="">
    </a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent"
            aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>

    <div class="collapse navbar-collapse" id="navbar">
        <ul class="navbar-nav mr-auto">
            <li class="nav-item active">
                <a class="nav-link link-my" href="<@spring.url '/profile/'/>">Профиль<span
                            class="sr-only">(current)</span></a>
            </li>
            <li class="nav-item">
                <a class="nav-link link-my" href="<@spring.url '/contestPanel'/>">Соревнования</a>
            </li>
            <li class="nav-item">
                <a class="nav-link link-my" href="<@spring.url '/problemPanel'/>">Архив</a>
            </li>
        </ul>
        <form class="form-inline" method="get" action="<@spring.url '/logout'/>">
            <button class="btn btn-outline-dark my-2 my-lg-0 btn-my" role="button" type="submit">Выйти из аккаунта
            </button>
        </form>
    </div>
</nav>