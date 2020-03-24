<#import "/spring.ftl" as spring>
<style>
    .bg-primary {
        background: #ffe5b4 !important;
    }

    .nav-link {
        color: darkturquoise !important;
    }

    .btn-success {
        color: darkturquoise !important;
        background: black !important;
    }
</style>
<nav class="navbar navbar-expand-lg navbar-dark bg-primary mb-3">
    <a class="navbar-brand" href="<@spring.url '/'/>">
        <img src="<@spring.url '/images/logo-removebg-preview.png'/>" width="56" height="56 "
             class="d-inline-block align-top" alt="">
    </a>
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
        <ul class="navbar-nav mr-auto">
            <li class="nav-item active">
                <a class="nav-link" href="<@spring.url '/profile/'/>">Профиль<span
                            class="sr-only">(current)</span></a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="<@spring.url '/contestPanel'/>">Соревнования</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="<@spring.url '/problemPanel'/>">Архив</a>
            </li>
        </ul>
        <ul class="nav justify-content-end">
            <a class="btn btn-success" href="<@spring.url '/logout'/>" role="button">Выйти из аккаунта</a>
        </ul>
    </div>
</nav>