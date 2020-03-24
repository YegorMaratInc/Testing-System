<#ftl encoding='UTF-8'>
<#import "/spring.ftl" as spring/>
<!DOCTYPE html>
<html lang="ru">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="<@spring.url 'http://maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css'/>" rel="stylesheet">
    <link href="<@spring.url '/css/style.css'/>" rel="stylesheet" type="text/css">
    <title>ITSprint->Активные контесты</title>
    <script src="<@spring.url '/js/jquery-3.4.1.min.js'/>"></script>
    <style type="text/css">
        body {
            background: #000000 !important;
        }

        .form-body {
            background: #fff;
            padding: 20px;
            margin-top: 57%;
        }

        .innter-form {
            padding-top: 20px;
        }

        .final-login li {
            width: 50%;
        }

        .nav-tabs {
            border-bottom: none !important;
        }

        .nav-tabs > li {
            color: #222 !important;
        }

        .nav-tabs > li.active > a, .nav-tabs > li.active > a:hover, .nav-tabs > li.active > a:focus {
            color: #000000;
            background-color: #ffe5b4;
            border: none !important;
            border-bottom-color: transparent;
        }

        .nav-tabs > li > a {
            margin-right: 2px;
            line-height: 1.428571429;
            border: none !important;
            text-transform: uppercase;
            font-size: 16px;
        }

        .social-login {
            text-align: center;
            font-size: 12px;
        }

        .social-login p {
            margin: 15px 0;
        }

        .social-login ul {
            margin: 0;
            padding: 0;
            list-style-type: none;
        }

        .social-login ul li {
            width: 33%;
            float: left;
        }

        .social-login ul li a {
            font-size: 13px;
            color: #fff;
            text-decoration: none;
            padding: 10px 0;
            display: block;
        }

        .social-login ul li:nth-child(1) a {
            background: #3b5998;
        }

        .social-login ul li:nth-child(2) a {
            background: #ffe5b4;
        }

        .social-login ul li:nth-child(3) a {
            background: #3698d9;
        }

        .sa-innate-form input[type=text], input[type=password], input[type=file], textarea, select, email {
            font-size: 13px;
            padding: 10px;
            border: 1px solid #ccc;
            outline: none;
            width: 100%;
            margin: 8px 0;

        }

        .sa-innate-form input[type=submit] {
            border: 1px solid #ffe5b4;
            background: #ffe5b4;
            color: #fff;
            padding: 10px 25px;
            font-size: 14px;
            margin-top: 5px;
        }

        .sa-innate-form input[type=submit]:hover {
            border: 1px solid #ffe5b4;
            background: #ffe5b4;
            color: #fff;
        }

        .sa-innate-form button {
            border: 1px solid #ffe5b4;
            background: #ffe5b4;
            color: #fff;
            padding: 10px 25px;
            font-size: 14px;
            margin-top: 5px;
        }

        .sa-innate-form button:hover {
            border: 1px solid #ffe5b4;
            background: #ffe5b4;
            color: #fff;
        }

        .sa-innate-form p {
            font-size: 13px;
            padding-top: 10px;
        }
    </style>
    <script src="http://code.jquery.com/jquery-1.11.1.min.js"></script>
    <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
</head>
<body>
<div id="particles-js">
    <div class="container">
        <div class="row">
            <div class="col-md-4 col-md-offset-4">
                <div class="form-body">
                    <ul class="nav nav-tabs final-login">
                        <li class="active"><a data-toggle="tab" href="#sectionA">Войти</a></li>
                        <li><a data-toggle="tab" href="#sectionB">Регистрация</a></li>
                    </ul>
                    <div class="tab-content">
                        <div id="sectionA" class="tab-pane fade in active">
                            <div class="innter-form">
                                <#if error??>
                                    <div class="alert alert-danger" role="alert">
                                        Логин или пароль введены неверно
                                    </div>
                                </#if>
                                <form method="post" action="<@spring.url '/login'/>">
                                    <div class="form-group">
                                        <label for="login">Логин</label>
                                        <input autofocus class="form-control" id="login" name="login"
                                               placeholder="Введите логин здесь..." required>
                                    </div>
                                    <div class="form-group">
                                        <label for="password">Пароль</label>
                                        <input type="password" class="form-control" id="password" name="password"
                                               placeholder="Введите пароль здесь..." required>
                                    </div>
                                    <div class="form-group form-check">
                                        <input type="checkbox" class="form-check-input" id="remember-me"
                                               name="remember-me">
                                        <label class="form-check-label" for="remember-me">Запомните меня!</label>
                                    </div>
                                    <div class="btn-group-vertical" role="group">
                                        <button class="btn btn-success" type="submit">
                                            Войти
                                        </button>
                                    </div>
                                </form>
                            </div>
                            <div class="clearfix"></div>
                        </div>
                        <div id="sectionB" class="tab-pane fade">
                            <div class="innter-form">
                                <#if signupError??>
                                    <div class="alert alert-danger" role="alert">
                                        ${alert}
                                    </div>
                                </#if>
                                <form method="post" action="<@spring.url '/signUp'/>">
                                    <div class="form-group">
                                        <label for="login">Логин</label>
                                        <input autofocus class="form-control" id="login" name="login"
                                               placeholder="Введите логин здесь..." required>
                                    </div>
                                    <div class="form-group">
                                        <label for="password">Пароль</label>
                                        <input type="password" class="form-control" id="password" name="password"
                                               placeholder="Введите пароль здесь..." required>
                                    </div>
                                    <div class="form-group">
                                        <label for="firstName">Имя</label>
                                        <input class="form-control" id="firstName" name="firstName"
                                               placeholder="Введите своё имя здесь..." required>
                                    </div>
                                    <div class="form-group">
                                        <label for="lastName">Фамилия</label>
                                        <input class="form-control" id="lastName" name="lastName"
                                               placeholder="Введите свою фамилию здесь..." required>
                                    </div>
                                    <button class="btn btn-success" type="submit">
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
<script type="text/javascript">
    $.getScript("https://cdnjs.cloudflare.com/ajax/libs/particles.js/2.0.0/particles.min.js", function () {
        particlesJS('particles-js',
            {
                "particles": {
                    "number": {
                        "value": 80,
                        "density": {
                            "enable": true,
                            "value_area": 800
                        }
                    },
                    "color": {
                        "value": "#ffffff"
                    },
                    "shape": {
                        "type": "circle",
                        "stroke": {
                            "width": 0,
                            "color": "#000000"
                        },
                        "polygon": {
                            "nb_sides": 5
                        },
                        "image": {
                            "width": 100,
                            "height": 100
                        }
                    },
                    "opacity": {
                        "value": 0.5,
                        "random": false,
                        "anim": {
                            "enable": false,
                            "speed": 1,
                            "opacity_min": 0.1,
                            "sync": false
                        }
                    },
                    "size": {
                        "value": 5,
                        "random": true,
                        "anim": {
                            "enable": false,
                            "speed": 40,
                            "size_min": 0.1,
                            "sync": false
                        }
                    },
                    "line_linked": {
                        "enable": true,
                        "distance": 150,
                        "color": "#ffffff",
                        "opacity": 0.4,
                        "width": 1
                    },
                    "move": {
                        "enable": true,
                        "speed": 6,
                        "direction": "none",
                        "random": false,
                        "straight": false,
                        "out_mode": "out",
                        "attract": {
                            "enable": false,
                            "rotateX": 600,
                            "rotateY": 1200
                        }
                    }
                },
                "interactivity": {
                    "detect_on": "canvas",
                    "events": {
                        "onhover": {
                            "enable": true,
                            "mode": "repulse"
                        },
                        "onclick": {
                            "enable": true,
                            "mode": "push"
                        },
                        "resize": true
                    },
                    "modes": {
                        "grab": {
                            "distance": 400,
                            "line_linked": {
                                "opacity": 1
                            }
                        },
                        "bubble": {
                            "distance": 400,
                            "size": 40,
                            "duration": 2,
                            "opacity": 8,
                            "speed": 3
                        },
                        "repulse": {
                            "distance": 200
                        },
                        "push": {
                            "particles_nb": 4
                        },
                        "remove": {
                            "particles_nb": 2
                        }
                    }
                },
                "retina_detect": true,
                "config_demo": {
                    "hide_card": false,
                    "background_color": "#b61924",
                    "background_image": "",
                    "background_position": "50% 50%",
                    "background_repeat": "no-repeat",
                    "background_size": "cover"
                }
            }
        );

    });
</script>
</body>
</html>
