<#ftl encoding='UTF-8'>
<#import "/spring.ftl" as spring/>
<!doctype html>
<html lang="ru">
<head>
    <link href="<@spring.url '/css/bootstrap.min.css'/>" rel="stylesheet" type="text/css">
    <link href="<@spring.url '/css/style.css'/>" rel="stylesheet" type="text/css">
    <script src="<@spring.url '/js/jquery-3.4.1.min.js'/>"></script>
    <title>ITSprint->Регистрация</title>
    <style>
        body {
            background: #efefef;
        }

        .form-body {
            background: #fff;
            padding: 20px;
        }

        .login-form {
            background: rgba(255, 255, 255, 0.8);
            padding: 20px;
            border-top: 3px solid #3e4043;
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
            color: #fff;
            background-color: #d14d42;
            border: none !important;
            border-bottom-color: transparent;
            border-radius: none !important;
        }

        .nav-tabs > li > a {
            margin-right: 2px;
            line-height: 1.428571429;
            border: none !important;
            border-radius: none !important;
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
            clear: fix;
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
            background: #e74c3d;
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
            border: 1px solid #e64b3b;
            background: #e64b3b;
            color: #fff;
            padding: 10px 25px;
            font-size: 14px;
            margin-top: 5px;
        }

        .sa-innate-form input[type=submit]:hover {
            border: 1px solid #db3b2b;
            background: #db3b2b;
            color: #fff;
        }

        .sa-innate-form button {
            border: 1px solid #e64b3b;
            background: #e64b3b;
            color: #fff;
            padding: 10px 25px;
            font-size: 14px;
            margin-top: 5px;
        }

        .sa-innate-form button:hover {
            border: 1px solid #db3b2b;
            background: #db3b2b;
            color: #fff;
        }

        .sa-innate-form p {
            font-size: 13px;
            padding-top: 10px;
        }
    </style>
</head>
<body>
<div id="playground-container" style="overflow: hidden">
    <div id="preview-container" style="display: none;">
        <iframe src="about:blank" frameborder="0" height="496" class="preview-iframe"></iframe>
    </div>
    <div class="container">
        <div class="row" itemscope="http://schema.org/Code">
            <div class="col-lg-12" itemprop="programmingLanguage" content="html/css/js">

                <div id="editor-html" class="playground-editor ace_editor ace-clouds"
                     style="height: 500px; display: none;" itemprop="sampleType"><textarea class="ace_text-input"
                                                                                           wrap="off" autocorrect="off"
                                                                                           autocapitalize="off"
                                                                                           spellcheck="false"
                                                                                           style="opacity: 0; height: 14px; width: 6.59781px; left: 90.5869px; top: 62px;"></textarea>
                    <div class="ace_gutter">
                        <div class="ace_layer ace_gutter-layer ace_folding-enabled"
                             style="margin-top: -8px; height: 524px; width: 47px;">
                            <div class="ace_gutter-cell " style="height: 14px;">5</div>
                            <div class="ace_gutter-cell " style="height: 14px;">6<span
                                        class="ace_fold-widget ace_start ace_open" style="height: 14px;"></span></div>
                            <div class="ace_gutter-cell " style="height: 14px;">7<span
                                        class="ace_fold-widget ace_start ace_open" style="height: 14px;"></span></div>
                            <div class="ace_gutter-cell " style="height: 14px;">8</div>
                            <div class="ace_gutter-cell " style="height: 14px;">9</div>
                            <div class="ace_gutter-cell " style="height: 14px;">10</div>
                            <div class="ace_gutter-cell " style="height: 14px;">11</div>
                            <div class="ace_gutter-cell " style="height: 14px;">12</div>
                            <div class="ace_gutter-cell " style="height: 14px;">13<span
                                        class="ace_fold-widget ace_start ace_open" style="height: 14px;"></span></div>
                            <div class="ace_gutter-cell " style="height: 14px;">14<span
                                        class="ace_fold-widget ace_start ace_open" style="height: 14px;"></span></div>
                            <div class="ace_gutter-cell " style="height: 14px;">15<span
                                        class="ace_fold-widget ace_start ace_open" style="height: 14px;"></span></div>
                            <div class="ace_gutter-cell " style="height: 14px;">16<span
                                        class="ace_fold-widget ace_start ace_open" style="height: 14px;"></span></div>
                            <div class="ace_gutter-cell " style="height: 14px;">17<span
                                        class="ace_fold-widget ace_start ace_open" style="height: 14px;"></span></div>
                            <div class="ace_gutter-cell " style="height: 14px;">18</div>
                            <div class="ace_gutter-cell " style="height: 14px;">19</div>
                            <div class="ace_gutter-cell " style="height: 14px;">20</div>
                            <div class="ace_gutter-cell " style="height: 14px;">21<span
                                        class="ace_fold-widget ace_start ace_open" style="height: 14px;"></span></div>
                            <div class="ace_gutter-cell " style="height: 14px;">22<span
                                        class="ace_fold-widget ace_start ace_open" style="height: 14px;"></span></div>
                            <div class="ace_gutter-cell " style="height: 14px;">23<span
                                        class="ace_fold-widget ace_start ace_open" style="height: 14px;"></span></div>
                            <div class="ace_gutter-cell " style="height: 14px;">24<span
                                        class="ace_fold-widget ace_start ace_open" style="height: 14px;"></span></div>
                            <div class="ace_gutter-cell " style="height: 14px;">25</div>
                            <div class="ace_gutter-cell " style="height: 14px;">26</div>
                            <div class="ace_gutter-cell " style="height: 14px;">27</div>
                            <div class="ace_gutter-cell " style="height: 14px;">28</div>
                            <div class="ace_gutter-cell " style="height: 14px;">29</div>
                            <div class="ace_gutter-cell " style="height: 14px;">30</div>
                            <div class="ace_gutter-cell " style="height: 14px;">31</div>
                            <div class="ace_gutter-cell " style="height: 14px;">32</div>
                            <div class="ace_gutter-cell " style="height: 14px;">33<span
                                        class="ace_fold-widget ace_start ace_open" style="height: 14px;"></span></div>
                            <div class="ace_gutter-cell " style="height: 14px;">34</div>
                            <div class="ace_gutter-cell " style="height: 14px;">35<span
                                        class="ace_fold-widget ace_start ace_open" style="height: 14px;"></span></div>
                            <div class="ace_gutter-cell " style="height: 14px;">36</div>
                            <div class="ace_gutter-cell " style="height: 14px;">37</div>
                            <div class="ace_gutter-cell " style="height: 14px;">38</div>
                            <div class="ace_gutter-cell " style="height: 14px;">39</div>
                            <div class="ace_gutter-cell " style="height: 14px;">40</div>
                            <div class="ace_gutter-cell " style="height: 14px;">41</div>
                            <div class="ace_gutter-cell " style="height: 14px;">42</div>
                        </div>
                        <div class="ace_gutter-active-line" style="top: 62px; height: 14px;"></div>
                    </div>
                    <div class="ace_scroller" style="left: 47px; right: 17px; bottom: 0px;">
                        <div class="ace_content"
                             style="margin-top: -8px; width: 1805px; height: 524px; margin-left: 0px;">
                            <div class="ace_layer ace_print-margin-layer">
                                <div class="ace_print-margin" style="left: 531.825px; visibility: visible;"></div>
                            </div>
                            <div class="ace_layer ace_marker-layer"></div>
                            <div class="ace_layer ace_text-layer" style="padding: 0px 4px;">
                                <div class="ace_line" style="height:14px"></div>
                                <div class="ace_line" style="height:14px"><span
                                            class="ace_meta ace_tag ace_punctuation ace_tag-open ace_xml">&lt;</span><span
                                            class="ace_meta ace_tag ace_tag-name ace_xml">div</span><span
                                            class="ace_text ace_tag-whitespace ace_xml"> </span><span
                                            class="ace_entity ace_other ace_attribute-name ace_xml">class</span><span
                                            class="ace_keyword ace_operator ace_attribute-equals ace_xml">=</span><span
                                            class="ace_string ace_attribute-value ace_xml">"container"</span><span
                                            class="ace_meta ace_tag ace_punctuation ace_tag-close ace_xml">&gt;</span>
                                </div>
                                <div class="ace_line" style="height:14px"><span
                                            class="ace_text ace_xml">    </span><span
                                            class="ace_meta ace_tag ace_punctuation ace_tag-open ace_xml">&lt;</span><span
                                            class="ace_meta ace_tag ace_tag-name ace_xml">div</span><span
                                            class="ace_text ace_tag-whitespace ace_xml"> </span><span
                                            class="ace_entity ace_other ace_attribute-name ace_xml">class</span><span
                                            class="ace_keyword ace_operator ace_attribute-equals ace_xml">=</span><span
                                            class="ace_string ace_attribute-value ace_xml">"row"</span><span
                                            class="ace_meta ace_tag ace_punctuation ace_tag-close ace_xml">&gt;</span>
                                </div>
                                <div class="ace_line" style="height:14px"><span
                                            class="ace_indent-guide">    </span><span
                                            class="ace_text ace_xml">    </span><span
                                            class="ace_meta ace_tag ace_punctuation ace_tag-open ace_xml">&lt;</span><span
                                            class="ace_meta ace_tag ace_tag-name ace_xml">h2</span><span
                                            class="ace_meta ace_tag ace_punctuation ace_tag-close ace_xml">&gt;</span><span
                                            class="ace_text ace_xml">Fancy Login / Registration form</span><span
                                            class="ace_meta ace_tag ace_punctuation ace_end-tag-open ace_xml">&lt;/</span><span
                                            class="ace_meta ace_tag ace_tag-name ace_xml">h2</span><span
                                            class="ace_meta ace_tag ace_punctuation ace_tag-close ace_xml">&gt;</span>
                                </div>
                                <div class="ace_line" style="height:14px"><span
                                            class="ace_text ace_xml">    </span><span
                                            class="ace_meta ace_tag ace_punctuation ace_end-tag-open ace_xml">&lt;/</span><span
                                            class="ace_meta ace_tag ace_tag-name ace_xml">div</span><span
                                            class="ace_meta ace_tag ace_punctuation ace_tag-close ace_xml">&gt;</span>
                                </div>
                                <div class="ace_line" style="height:14px"><span
                                            class="ace_meta ace_tag ace_punctuation ace_end-tag-open ace_xml">&lt;/</span><span
                                            class="ace_meta ace_tag ace_tag-name ace_xml">div</span><span
                                            class="ace_meta ace_tag ace_punctuation ace_tag-close ace_xml">&gt;</span>
                                </div>
                                <div class="ace_line" style="height:14px"><span
                                            class="ace_meta ace_tag ace_punctuation ace_tag-open ace_xml">&lt;</span><span
                                            class="ace_meta ace_tag ace_tag-name ace_xml">br</span><span
                                            class="ace_meta ace_tag ace_punctuation ace_tag-close ace_xml">&gt;</span>
                                </div>
                                <div class="ace_line" style="height:14px"><span
                                            class="ace_meta ace_tag ace_punctuation ace_tag-open ace_xml">&lt;</span><span
                                            class="ace_meta ace_tag ace_tag-name ace_xml">br</span><span
                                            class="ace_meta ace_tag ace_punctuation ace_tag-close ace_xml">&gt;</span>
                                </div>
                                <div class="ace_line" style="height:14px"><span
                                            class="ace_meta ace_tag ace_punctuation ace_tag-open ace_xml">&lt;</span><span
                                            class="ace_meta ace_tag ace_tag-name ace_xml">div</span><span
                                            class="ace_text ace_tag-whitespace ace_xml"> </span><span
                                            class="ace_entity ace_other ace_attribute-name ace_xml">class</span><span
                                            class="ace_keyword ace_operator ace_attribute-equals ace_xml">=</span><span
                                            class="ace_string ace_attribute-value ace_xml">"container"</span><span
                                            class="ace_meta ace_tag ace_punctuation ace_tag-close ace_xml">&gt;</span>
                                </div>
                                <div class="ace_line" style="height:14px"><span
                                            class="ace_meta ace_tag ace_punctuation ace_tag-open ace_xml">&lt;</span><span
                                            class="ace_meta ace_tag ace_tag-name ace_xml">div</span><span
                                            class="ace_text ace_tag-whitespace ace_xml"> </span><span
                                            class="ace_entity ace_other ace_attribute-name ace_xml">class</span><span
                                            class="ace_keyword ace_operator ace_attribute-equals ace_xml">=</span><span
                                            class="ace_string ace_attribute-value ace_xml">"row"</span><span
                                            class="ace_meta ace_tag ace_punctuation ace_tag-close ace_xml">&gt;</span>
                                </div>
                                <div class="ace_line" style="height:14px"><span
                                            class="ace_meta ace_tag ace_punctuation ace_tag-open ace_xml">&lt;</span><span
                                            class="ace_meta ace_tag ace_tag-name ace_xml">div</span><span
                                            class="ace_text ace_tag-whitespace ace_xml"> </span><span
                                            class="ace_entity ace_other ace_attribute-name ace_xml">class</span><span
                                            class="ace_keyword ace_operator ace_attribute-equals ace_xml">=</span><span
                                            class="ace_string ace_attribute-value ace_xml">"col-md-4 col-md-offset-4"</span><span
                                            class="ace_meta ace_tag ace_punctuation ace_tag-close ace_xml">&gt;</span>
                                </div>
                                <div class="ace_line" style="height:14px"><span
                                            class="ace_meta ace_tag ace_punctuation ace_tag-open ace_xml">&lt;</span><span
                                            class="ace_meta ace_tag ace_tag-name ace_xml">div</span><span
                                            class="ace_text ace_tag-whitespace ace_xml"> </span><span
                                            class="ace_entity ace_other ace_attribute-name ace_xml">class</span><span
                                            class="ace_keyword ace_operator ace_attribute-equals ace_xml">=</span><span
                                            class="ace_string ace_attribute-value ace_xml">"form-body"</span><span
                                            class="ace_meta ace_tag ace_punctuation ace_tag-close ace_xml">&gt;</span>
                                </div>
                                <div class="ace_line" style="height:14px"><span
                                            class="ace_text ace_xml">    </span><span
                                            class="ace_meta ace_tag ace_punctuation ace_tag-open ace_xml">&lt;</span><span
                                            class="ace_meta ace_tag ace_tag-name ace_xml">ul</span><span
                                            class="ace_text ace_tag-whitespace ace_xml"> </span><span
                                            class="ace_entity ace_other ace_attribute-name ace_xml">class</span><span
                                            class="ace_keyword ace_operator ace_attribute-equals ace_xml">=</span><span
                                            class="ace_string ace_attribute-value ace_xml">"nav nav-tabs final-login"</span><span
                                            class="ace_meta ace_tag ace_punctuation ace_tag-close ace_xml">&gt;</span>
                                </div>
                                <div class="ace_line" style="height:14px"><span
                                            class="ace_indent-guide">    </span><span
                                            class="ace_text ace_xml">    </span><span
                                            class="ace_meta ace_tag ace_punctuation ace_tag-open ace_xml">&lt;</span><span
                                            class="ace_meta ace_tag ace_tag-name ace_xml">li</span><span
                                            class="ace_text ace_tag-whitespace ace_xml"> </span><span
                                            class="ace_entity ace_other ace_attribute-name ace_xml">class</span><span
                                            class="ace_keyword ace_operator ace_attribute-equals ace_xml">=</span><span
                                            class="ace_string ace_attribute-value ace_xml">"active"</span><span
                                            class="ace_meta ace_tag ace_punctuation ace_tag-close ace_xml">&gt;</span><span
                                            class="ace_meta ace_tag ace_punctuation ace_tag-open ace_xml">&lt;</span><span
                                            class="ace_meta ace_tag ace_anchor ace_tag-name ace_xml">a</span><span
                                            class="ace_text ace_tag-whitespace ace_xml"> </span><span
                                            class="ace_entity ace_other ace_attribute-name ace_xml">data-toggle</span><span
                                            class="ace_keyword ace_operator ace_attribute-equals ace_xml">=</span><span
                                            class="ace_string ace_attribute-value ace_xml">"tab"</span><span
                                            class="ace_text ace_tag-whitespace ace_xml"> </span><span
                                            class="ace_entity ace_other ace_attribute-name ace_xml">href</span><span
                                            class="ace_keyword ace_operator ace_attribute-equals ace_xml">=</span><span
                                            class="ace_string ace_attribute-value ace_xml">"#sectionA"</span><span
                                            class="ace_meta ace_tag ace_punctuation ace_tag-close ace_xml">&gt;</span><span
                                            class="ace_text ace_xml">Sign In</span><span
                                            class="ace_meta ace_tag ace_punctuation ace_end-tag-open ace_xml">&lt;/</span><span
                                            class="ace_meta ace_tag ace_anchor ace_tag-name ace_xml">a</span><span
                                            class="ace_meta ace_tag ace_punctuation ace_tag-close ace_xml">&gt;</span><span
                                            class="ace_meta ace_tag ace_punctuation ace_end-tag-open ace_xml">&lt;/</span><span
                                            class="ace_meta ace_tag ace_tag-name ace_xml">li</span><span
                                            class="ace_meta ace_tag ace_punctuation ace_tag-close ace_xml">&gt;</span>
                                </div>
                                <div class="ace_line" style="height:14px"><span
                                            class="ace_indent-guide">    </span><span
                                            class="ace_text ace_xml">    </span><span
                                            class="ace_meta ace_tag ace_punctuation ace_tag-open ace_xml">&lt;</span><span
                                            class="ace_meta ace_tag ace_tag-name ace_xml">li</span><span
                                            class="ace_meta ace_tag ace_punctuation ace_tag-close ace_xml">&gt;</span><span
                                            class="ace_meta ace_tag ace_punctuation ace_tag-open ace_xml">&lt;</span><span
                                            class="ace_meta ace_tag ace_anchor ace_tag-name ace_xml">a</span><span
                                            class="ace_text ace_tag-whitespace ace_xml"> </span><span
                                            class="ace_entity ace_other ace_attribute-name ace_xml">data-toggle</span><span
                                            class="ace_keyword ace_operator ace_attribute-equals ace_xml">=</span><span
                                            class="ace_string ace_attribute-value ace_xml">"tab"</span><span
                                            class="ace_text ace_tag-whitespace ace_xml"> </span><span
                                            class="ace_entity ace_other ace_attribute-name ace_xml">href</span><span
                                            class="ace_keyword ace_operator ace_attribute-equals ace_xml">=</span><span
                                            class="ace_string ace_attribute-value ace_xml">"#sectionB"</span><span
                                            class="ace_meta ace_tag ace_punctuation ace_tag-close ace_xml">&gt;</span><span
                                            class="ace_text ace_xml">Join us!</span><span
                                            class="ace_meta ace_tag ace_punctuation ace_end-tag-open ace_xml">&lt;/</span><span
                                            class="ace_meta ace_tag ace_anchor ace_tag-name ace_xml">a</span><span
                                            class="ace_meta ace_tag ace_punctuation ace_tag-close ace_xml">&gt;</span><span
                                            class="ace_meta ace_tag ace_punctuation ace_end-tag-open ace_xml">&lt;/</span><span
                                            class="ace_meta ace_tag ace_tag-name ace_xml">li</span><span
                                            class="ace_meta ace_tag ace_punctuation ace_tag-close ace_xml">&gt;</span>
                                </div>
                                <div class="ace_line" style="height:14px"><span
                                            class="ace_text ace_xml">    </span><span
                                            class="ace_meta ace_tag ace_punctuation ace_end-tag-open ace_xml">&lt;/</span><span
                                            class="ace_meta ace_tag ace_tag-name ace_xml">ul</span><span
                                            class="ace_meta ace_tag ace_punctuation ace_tag-close ace_xml">&gt;</span>
                                </div>
                                <div class="ace_line" style="height:14px"><span
                                            class="ace_text ace_xml">    </span><span
                                            class="ace_meta ace_tag ace_punctuation ace_tag-open ace_xml">&lt;</span><span
                                            class="ace_meta ace_tag ace_tag-name ace_xml">div</span><span
                                            class="ace_text ace_tag-whitespace ace_xml"> </span><span
                                            class="ace_entity ace_other ace_attribute-name ace_xml">class</span><span
                                            class="ace_keyword ace_operator ace_attribute-equals ace_xml">=</span><span
                                            class="ace_string ace_attribute-value ace_xml">"tab-content"</span><span
                                            class="ace_meta ace_tag ace_punctuation ace_tag-close ace_xml">&gt;</span>
                                </div>
                                <div class="ace_line" style="height:14px"><span
                                            class="ace_indent-guide">    </span><span
                                            class="ace_text ace_xml">    </span><span
                                            class="ace_meta ace_tag ace_punctuation ace_tag-open ace_xml">&lt;</span><span
                                            class="ace_meta ace_tag ace_tag-name ace_xml">div</span><span
                                            class="ace_text ace_tag-whitespace ace_xml"> </span><span
                                            class="ace_entity ace_other ace_attribute-name ace_xml">id</span><span
                                            class="ace_keyword ace_operator ace_attribute-equals ace_xml">=</span><span
                                            class="ace_string ace_attribute-value ace_xml">"sectionA"</span><span
                                            class="ace_text ace_tag-whitespace ace_xml"> </span><span
                                            class="ace_entity ace_other ace_attribute-name ace_xml">class</span><span
                                            class="ace_keyword ace_operator ace_attribute-equals ace_xml">=</span><span
                                            class="ace_string ace_attribute-value ace_xml">"tab-pane fade in active"</span><span
                                            class="ace_meta ace_tag ace_punctuation ace_tag-close ace_xml">&gt;</span>
                                </div>
                                <div class="ace_line" style="height:14px"><span
                                            class="ace_indent-guide">    </span><span
                                            class="ace_text ace_xml">    </span><span
                                            class="ace_meta ace_tag ace_punctuation ace_tag-open ace_xml">&lt;</span><span
                                            class="ace_meta ace_tag ace_tag-name ace_xml">div</span><span
                                            class="ace_text ace_tag-whitespace ace_xml"> </span><span
                                            class="ace_entity ace_other ace_attribute-name ace_xml">class</span><span
                                            class="ace_keyword ace_operator ace_attribute-equals ace_xml">=</span><span
                                            class="ace_string ace_attribute-value ace_xml">"innter-form"</span><span
                                            class="ace_meta ace_tag ace_punctuation ace_tag-close ace_xml">&gt;</span>
                                </div>
                                <div class="ace_line" style="height:14px"><span
                                            class="ace_indent-guide">    </span><span
                                            class="ace_indent-guide">    </span><span
                                            class="ace_text ace_xml">    </span><span
                                            class="ace_meta ace_tag ace_punctuation ace_tag-open ace_xml">&lt;</span><span
                                            class="ace_meta ace_tag ace_form ace_tag-name ace_xml">form</span><span
                                            class="ace_text ace_tag-whitespace ace_xml"> </span><span
                                            class="ace_entity ace_other ace_attribute-name ace_xml">class</span><span
                                            class="ace_keyword ace_operator ace_attribute-equals ace_xml">=</span><span
                                            class="ace_string ace_attribute-value ace_xml">"sa-innate-form"</span><span
                                            class="ace_text ace_tag-whitespace ace_xml"> </span><span
                                            class="ace_entity ace_other ace_attribute-name ace_xml">method</span><span
                                            class="ace_keyword ace_operator ace_attribute-equals ace_xml">=</span><span
                                            class="ace_string ace_attribute-value ace_xml">"post"</span><span
                                            class="ace_meta ace_tag ace_punctuation ace_tag-close ace_xml">&gt;</span>
                                </div>
                                <div class="ace_line" style="height:14px"><span
                                            class="ace_indent-guide">    </span><span
                                            class="ace_indent-guide">    </span><span
                                            class="ace_text ace_xml">    </span><span
                                            class="ace_meta ace_tag ace_punctuation ace_tag-open ace_xml">&lt;</span><span
                                            class="ace_meta ace_tag ace_form ace_tag-name ace_xml">label</span><span
                                            class="ace_meta ace_tag ace_punctuation ace_tag-close ace_xml">&gt;</span><span
                                            class="ace_text ace_xml">Email Address</span><span
                                            class="ace_meta ace_tag ace_punctuation ace_end-tag-open ace_xml">&lt;/</span><span
                                            class="ace_meta ace_tag ace_form ace_tag-name ace_xml">label</span><span
                                            class="ace_meta ace_tag ace_punctuation ace_tag-close ace_xml">&gt;</span>
                                </div>
                                <div class="ace_line" style="height:14px"><span
                                            class="ace_indent-guide">    </span><span
                                            class="ace_indent-guide">    </span><span
                                            class="ace_text ace_xml">    </span><span
                                            class="ace_meta ace_tag ace_punctuation ace_tag-open ace_xml">&lt;</span><span
                                            class="ace_meta ace_tag ace_form ace_tag-name ace_xml">input</span><span
                                            class="ace_text ace_tag-whitespace ace_xml"> </span><span
                                            class="ace_entity ace_other ace_attribute-name ace_xml">type</span><span
                                            class="ace_keyword ace_operator ace_attribute-equals ace_xml">=</span><span
                                            class="ace_string ace_attribute-value ace_xml">"text"</span><span
                                            class="ace_text ace_tag-whitespace ace_xml"> </span><span
                                            class="ace_entity ace_other ace_attribute-name ace_xml">name</span><span
                                            class="ace_keyword ace_operator ace_attribute-equals ace_xml">=</span><span
                                            class="ace_string ace_attribute-value ace_xml">"username"</span><span
                                            class="ace_meta ace_tag ace_punctuation ace_tag-close ace_xml">&gt;</span>
                                </div>
                                <div class="ace_line" style="height:14px"><span
                                            class="ace_indent-guide">    </span><span
                                            class="ace_indent-guide">    </span><span
                                            class="ace_text ace_xml">    </span><span
                                            class="ace_meta ace_tag ace_punctuation ace_tag-open ace_xml">&lt;</span><span
                                            class="ace_meta ace_tag ace_form ace_tag-name ace_xml">label</span><span
                                            class="ace_meta ace_tag ace_punctuation ace_tag-close ace_xml">&gt;</span><span
                                            class="ace_text ace_xml">Password</span><span
                                            class="ace_meta ace_tag ace_punctuation ace_end-tag-open ace_xml">&lt;/</span><span
                                            class="ace_meta ace_tag ace_form ace_tag-name ace_xml">label</span><span
                                            class="ace_meta ace_tag ace_punctuation ace_tag-close ace_xml">&gt;</span>
                                </div>
                                <div class="ace_line" style="height:14px"><span
                                            class="ace_indent-guide">    </span><span
                                            class="ace_indent-guide">    </span><span
                                            class="ace_text ace_xml">    </span><span
                                            class="ace_meta ace_tag ace_punctuation ace_tag-open ace_xml">&lt;</span><span
                                            class="ace_meta ace_tag ace_form ace_tag-name ace_xml">input</span><span
                                            class="ace_text ace_tag-whitespace ace_xml"> </span><span
                                            class="ace_entity ace_other ace_attribute-name ace_xml">type</span><span
                                            class="ace_keyword ace_operator ace_attribute-equals ace_xml">=</span><span
                                            class="ace_string ace_attribute-value ace_xml">"password"</span><span
                                            class="ace_text ace_tag-whitespace ace_xml"> </span><span
                                            class="ace_entity ace_other ace_attribute-name ace_xml">name</span><span
                                            class="ace_keyword ace_operator ace_attribute-equals ace_xml">=</span><span
                                            class="ace_string ace_attribute-value ace_xml">"password"</span><span
                                            class="ace_meta ace_tag ace_punctuation ace_tag-close ace_xml">&gt;</span>
                                </div>
                                <div class="ace_line" style="height:14px"><span
                                            class="ace_indent-guide">    </span><span
                                            class="ace_indent-guide">    </span><span
                                            class="ace_text ace_xml">    </span><span
                                            class="ace_meta ace_tag ace_punctuation ace_tag-open ace_xml">&lt;</span><span
                                            class="ace_meta ace_tag ace_form ace_tag-name ace_xml">button</span><span
                                            class="ace_text ace_tag-whitespace ace_xml"> </span><span
                                            class="ace_entity ace_other ace_attribute-name ace_xml">type</span><span
                                            class="ace_keyword ace_operator ace_attribute-equals ace_xml">=</span><span
                                            class="ace_string ace_attribute-value ace_xml">"submit"</span><span
                                            class="ace_meta ace_tag ace_punctuation ace_tag-close ace_xml">&gt;</span><span
                                            class="ace_text ace_xml">Sign In</span><span
                                            class="ace_meta ace_tag ace_punctuation ace_end-tag-open ace_xml">&lt;/</span><span
                                            class="ace_meta ace_tag ace_form ace_tag-name ace_xml">button</span><span
                                            class="ace_meta ace_tag ace_punctuation ace_tag-close ace_xml">&gt;</span>
                                </div>
                                <div class="ace_line" style="height:14px"><span
                                            class="ace_indent-guide">    </span><span
                                            class="ace_indent-guide">    </span><span
                                            class="ace_text ace_xml">    </span><span
                                            class="ace_meta ace_tag ace_punctuation ace_tag-open ace_xml">&lt;</span><span
                                            class="ace_meta ace_tag ace_anchor ace_tag-name ace_xml">a</span><span
                                            class="ace_text ace_tag-whitespace ace_xml"> </span><span
                                            class="ace_entity ace_other ace_attribute-name ace_xml">href</span><span
                                            class="ace_keyword ace_operator ace_attribute-equals ace_xml">=</span><span
                                            class="ace_string ace_attribute-value ace_xml">""</span><span
                                            class="ace_meta ace_tag ace_punctuation ace_tag-close ace_xml">&gt;</span><span
                                            class="ace_text ace_xml">Forgot Password?</span><span
                                            class="ace_meta ace_tag ace_punctuation ace_end-tag-open ace_xml">&lt;/</span><span
                                            class="ace_meta ace_tag ace_anchor ace_tag-name ace_xml">a</span><span
                                            class="ace_meta ace_tag ace_punctuation ace_tag-close ace_xml">&gt;</span>
                                </div>
                                <div class="ace_line" style="height:14px"><span
                                            class="ace_indent-guide">    </span><span
                                            class="ace_indent-guide">    </span><span
                                            class="ace_text ace_xml">    </span><span
                                            class="ace_meta ace_tag ace_punctuation ace_end-tag-open ace_xml">&lt;/</span><span
                                            class="ace_meta ace_tag ace_form ace_tag-name ace_xml">form</span><span
                                            class="ace_meta ace_tag ace_punctuation ace_tag-close ace_xml">&gt;</span>
                                </div>
                                <div class="ace_line" style="height:14px"><span
                                            class="ace_indent-guide">    </span><span
                                            class="ace_indent-guide">    </span><span
                                            class="ace_text ace_xml">    </span><span
                                            class="ace_meta ace_tag ace_punctuation ace_end-tag-open ace_xml">&lt;/</span><span
                                            class="ace_meta ace_tag ace_tag-name ace_xml">div</span><span
                                            class="ace_meta ace_tag ace_punctuation ace_tag-close ace_xml">&gt;</span>
                                </div>
                                <div class="ace_line" style="height:14px"><span
                                            class="ace_indent-guide">    </span><span
                                            class="ace_indent-guide">    </span><span
                                            class="ace_text ace_xml">    </span><span
                                            class="ace_meta ace_tag ace_punctuation ace_tag-open ace_xml">&lt;</span><span
                                            class="ace_meta ace_tag ace_tag-name ace_xml">div</span><span
                                            class="ace_text ace_tag-whitespace ace_xml"> </span><span
                                            class="ace_entity ace_other ace_attribute-name ace_xml">class</span><span
                                            class="ace_keyword ace_operator ace_attribute-equals ace_xml">=</span><span
                                            class="ace_string ace_attribute-value ace_xml">"social-login"</span><span
                                            class="ace_meta ace_tag ace_punctuation ace_tag-close ace_xml">&gt;</span>
                                </div>
                                <div class="ace_line" style="height:14px"><span
                                            class="ace_indent-guide">    </span><span
                                            class="ace_indent-guide">    </span><span
                                            class="ace_text ace_xml">    </span><span
                                            class="ace_meta ace_tag ace_punctuation ace_tag-open ace_xml">&lt;</span><span
                                            class="ace_meta ace_tag ace_tag-name ace_xml">p</span><span
                                            class="ace_meta ace_tag ace_punctuation ace_tag-close ace_xml">&gt;</span><span
                                            class="ace_text ace_xml">- - - - - - - - - - - - - Sign In With - - - - - - - - - - - - - </span><span
                                            class="ace_meta ace_tag ace_punctuation ace_end-tag-open ace_xml">&lt;/</span><span
                                            class="ace_meta ace_tag ace_tag-name ace_xml">p</span><span
                                            class="ace_meta ace_tag ace_punctuation ace_tag-close ace_xml">&gt;</span>
                                </div>
                                <div class="ace_line" style="height:14px"><span
                                            class="ace_text ace_xml">            </span><span
                                            class="ace_meta ace_tag ace_punctuation ace_tag-open ace_xml">&lt;</span><span
                                            class="ace_meta ace_tag ace_tag-name ace_xml">ul</span><span
                                            class="ace_meta ace_tag ace_punctuation ace_tag-close ace_xml">&gt;</span>
                                </div>
                                <div class="ace_line" style="height:14px"><span
                                            class="ace_indent-guide">    </span><span
                                            class="ace_indent-guide">    </span><span
                                            class="ace_text ace_xml">    </span><span
                                            class="ace_meta ace_tag ace_punctuation ace_tag-open ace_xml">&lt;</span><span
                                            class="ace_meta ace_tag ace_tag-name ace_xml">li</span><span
                                            class="ace_meta ace_tag ace_punctuation ace_tag-close ace_xml">&gt;</span><span
                                            class="ace_meta ace_tag ace_punctuation ace_tag-open ace_xml">&lt;</span><span
                                            class="ace_meta ace_tag ace_anchor ace_tag-name ace_xml">a</span><span
                                            class="ace_text ace_tag-whitespace ace_xml"> </span><span
                                            class="ace_entity ace_other ace_attribute-name ace_xml">href</span><span
                                            class="ace_keyword ace_operator ace_attribute-equals ace_xml">=</span><span
                                            class="ace_string ace_attribute-value ace_xml">""</span><span
                                            class="ace_meta ace_tag ace_punctuation ace_tag-close ace_xml">&gt;</span><span
                                            class="ace_meta ace_tag ace_punctuation ace_tag-open ace_xml">&lt;</span><span
                                            class="ace_meta ace_tag ace_tag-name ace_xml">i</span><span
                                            class="ace_text ace_tag-whitespace ace_xml"> </span><span
                                            class="ace_entity ace_other ace_attribute-name ace_xml">class</span><span
                                            class="ace_keyword ace_operator ace_attribute-equals ace_xml">=</span><span
                                            class="ace_string ace_attribute-value ace_xml">"fa fa-facebook"</span><span
                                            class="ace_meta ace_tag ace_punctuation ace_tag-close ace_xml">&gt;</span><span
                                            class="ace_meta ace_tag ace_punctuation ace_end-tag-open ace_xml">&lt;/</span><span
                                            class="ace_meta ace_tag ace_tag-name ace_xml">i</span><span
                                            class="ace_meta ace_tag ace_punctuation ace_tag-close ace_xml">&gt;</span><span
                                            class="ace_text ace_xml"> Facebook</span><span
                                            class="ace_meta ace_tag ace_punctuation ace_end-tag-open ace_xml">&lt;/</span><span
                                            class="ace_meta ace_tag ace_anchor ace_tag-name ace_xml">a</span><span
                                            class="ace_meta ace_tag ace_punctuation ace_tag-close ace_xml">&gt;</span><span
                                            class="ace_meta ace_tag ace_punctuation ace_end-tag-open ace_xml">&lt;/</span><span
                                            class="ace_meta ace_tag ace_tag-name ace_xml">li</span><span
                                            class="ace_meta ace_tag ace_punctuation ace_tag-close ace_xml">&gt;</span>
                                </div>
                                <div class="ace_line" style="height:14px"><span
                                            class="ace_indent-guide">    </span><span
                                            class="ace_indent-guide">    </span><span
                                            class="ace_text ace_xml">    </span><span
                                            class="ace_meta ace_tag ace_punctuation ace_tag-open ace_xml">&lt;</span><span
                                            class="ace_meta ace_tag ace_tag-name ace_xml">li</span><span
                                            class="ace_meta ace_tag ace_punctuation ace_tag-close ace_xml">&gt;</span><span
                                            class="ace_meta ace_tag ace_punctuation ace_tag-open ace_xml">&lt;</span><span
                                            class="ace_meta ace_tag ace_anchor ace_tag-name ace_xml">a</span><span
                                            class="ace_text ace_tag-whitespace ace_xml"> </span><span
                                            class="ace_entity ace_other ace_attribute-name ace_xml">href</span><span
                                            class="ace_keyword ace_operator ace_attribute-equals ace_xml">=</span><span
                                            class="ace_string ace_attribute-value ace_xml">""</span><span
                                            class="ace_meta ace_tag ace_punctuation ace_tag-close ace_xml">&gt;</span><span
                                            class="ace_meta ace_tag ace_punctuation ace_tag-open ace_xml">&lt;</span><span
                                            class="ace_meta ace_tag ace_tag-name ace_xml">i</span><span
                                            class="ace_text ace_tag-whitespace ace_xml"> </span><span
                                            class="ace_entity ace_other ace_attribute-name ace_xml">class</span><span
                                            class="ace_keyword ace_operator ace_attribute-equals ace_xml">=</span><span
                                            class="ace_string ace_attribute-value ace_xml">"fa fa-google-plus"</span><span
                                            class="ace_meta ace_tag ace_punctuation ace_tag-close ace_xml">&gt;</span><span
                                            class="ace_meta ace_tag ace_punctuation ace_end-tag-open ace_xml">&lt;/</span><span
                                            class="ace_meta ace_tag ace_tag-name ace_xml">i</span><span
                                            class="ace_meta ace_tag ace_punctuation ace_tag-close ace_xml">&gt;</span><span
                                            class="ace_text ace_xml"> Google+</span><span
                                            class="ace_meta ace_tag ace_punctuation ace_end-tag-open ace_xml">&lt;/</span><span
                                            class="ace_meta ace_tag ace_anchor ace_tag-name ace_xml">a</span><span
                                            class="ace_meta ace_tag ace_punctuation ace_tag-close ace_xml">&gt;</span><span
                                            class="ace_meta ace_tag ace_punctuation ace_end-tag-open ace_xml">&lt;/</span><span
                                            class="ace_meta ace_tag ace_tag-name ace_xml">li</span><span
                                            class="ace_meta ace_tag ace_punctuation ace_tag-close ace_xml">&gt;</span>
                                </div>
                                <div class="ace_line" style="height:14px"><span
                                            class="ace_indent-guide">    </span><span
                                            class="ace_indent-guide">    </span><span
                                            class="ace_text ace_xml">    </span><span
                                            class="ace_meta ace_tag ace_punctuation ace_tag-open ace_xml">&lt;</span><span
                                            class="ace_meta ace_tag ace_tag-name ace_xml">li</span><span
                                            class="ace_meta ace_tag ace_punctuation ace_tag-close ace_xml">&gt;</span><span
                                            class="ace_meta ace_tag ace_punctuation ace_tag-open ace_xml">&lt;</span><span
                                            class="ace_meta ace_tag ace_anchor ace_tag-name ace_xml">a</span><span
                                            class="ace_text ace_tag-whitespace ace_xml"> </span><span
                                            class="ace_entity ace_other ace_attribute-name ace_xml">href</span><span
                                            class="ace_keyword ace_operator ace_attribute-equals ace_xml">=</span><span
                                            class="ace_string ace_attribute-value ace_xml">""</span><span
                                            class="ace_meta ace_tag ace_punctuation ace_tag-close ace_xml">&gt;</span><span
                                            class="ace_meta ace_tag ace_punctuation ace_tag-open ace_xml">&lt;</span><span
                                            class="ace_meta ace_tag ace_tag-name ace_xml">i</span><span
                                            class="ace_text ace_tag-whitespace ace_xml"> </span><span
                                            class="ace_entity ace_other ace_attribute-name ace_xml">class</span><span
                                            class="ace_keyword ace_operator ace_attribute-equals ace_xml">=</span><span
                                            class="ace_string ace_attribute-value ace_xml">"fa fa-twitter"</span><span
                                            class="ace_meta ace_tag ace_punctuation ace_tag-close ace_xml">&gt;</span><span
                                            class="ace_meta ace_tag ace_punctuation ace_end-tag-open ace_xml">&lt;/</span><span
                                            class="ace_meta ace_tag ace_tag-name ace_xml">i</span><span
                                            class="ace_meta ace_tag ace_punctuation ace_tag-close ace_xml">&gt;</span><span
                                            class="ace_text ace_xml"> Twitter</span><span
                                            class="ace_meta ace_tag ace_punctuation ace_end-tag-open ace_xml">&lt;/</span><span
                                            class="ace_meta ace_tag ace_anchor ace_tag-name ace_xml">a</span><span
                                            class="ace_meta ace_tag ace_punctuation ace_tag-close ace_xml">&gt;</span><span
                                            class="ace_meta ace_tag ace_punctuation ace_end-tag-open ace_xml">&lt;/</span><span
                                            class="ace_meta ace_tag ace_tag-name ace_xml">li</span><span
                                            class="ace_meta ace_tag ace_punctuation ace_tag-close ace_xml">&gt;</span>
                                </div>
                                <div class="ace_line" style="height:14px"><span
                                            class="ace_indent-guide">    </span><span
                                            class="ace_indent-guide">    </span><span
                                            class="ace_text ace_xml">    </span><span
                                            class="ace_meta ace_tag ace_punctuation ace_end-tag-open ace_xml">&lt;/</span><span
                                            class="ace_meta ace_tag ace_tag-name ace_xml">ul</span><span
                                            class="ace_meta ace_tag ace_punctuation ace_tag-close ace_xml">&gt;</span>
                                </div>
                                <div class="ace_line" style="height:14px"><span
                                            class="ace_indent-guide">    </span><span
                                            class="ace_indent-guide">    </span><span
                                            class="ace_text ace_xml">    </span><span
                                            class="ace_meta ace_tag ace_punctuation ace_end-tag-open ace_xml">&lt;/</span><span
                                            class="ace_meta ace_tag ace_tag-name ace_xml">div</span><span
                                            class="ace_meta ace_tag ace_punctuation ace_tag-close ace_xml">&gt;</span>
                                </div>
                                <div class="ace_line" style="height:14px"><span
                                            class="ace_indent-guide">    </span><span
                                            class="ace_indent-guide">    </span><span
                                            class="ace_text ace_xml">    </span><span
                                            class="ace_meta ace_tag ace_punctuation ace_tag-open ace_xml">&lt;</span><span
                                            class="ace_meta ace_tag ace_tag-name ace_xml">div</span><span
                                            class="ace_text ace_tag-whitespace ace_xml"> </span><span
                                            class="ace_entity ace_other ace_attribute-name ace_xml">class</span><span
                                            class="ace_keyword ace_operator ace_attribute-equals ace_xml">=</span><span
                                            class="ace_string ace_attribute-value ace_xml">"clearfix"</span><span
                                            class="ace_meta ace_tag ace_punctuation ace_tag-close ace_xml">&gt;</span><span
                                            class="ace_meta ace_tag ace_punctuation ace_end-tag-open ace_xml">&lt;/</span><span
                                            class="ace_meta ace_tag ace_tag-name ace_xml">div</span><span
                                            class="ace_meta ace_tag ace_punctuation ace_tag-close ace_xml">&gt;</span>
                                </div>
                            </div>
                            <div class="ace_layer ace_marker-layer"></div>
                            <div class="ace_layer ace_cursor-layer ace_hidden-cursors">
                                <div class="ace_cursor"
                                     style="left: 43.5869px; top: 70px; width: 6.59781px; height: 14px;"></div>
                            </div>
                        </div>
                    </div>
                    <div class="ace_scrollbar ace_scrollbar-v" style="width: 22px; bottom: 0px;">
                        <div class="ace_scrollbar-inner" style="width: 22px; height: 980px;"></div>
                    </div>
                    <div class="ace_scrollbar ace_scrollbar-h"
                         style="display: none; height: 22px; left: 47px; right: 17px;">
                        <div class="ace_scrollbar-inner" style="height: 22px; width: 1852px;"></div>
                    </div>
                    <div style="height: auto; width: auto; top: 0px; left: 0px; visibility: hidden; position: absolute; white-space: pre; font: inherit; overflow: hidden;">
                        <div style="height: auto; width: auto; top: 0px; left: 0px; visibility: hidden; position: absolute; white-space: pre; font: inherit; overflow: visible;"></div>
                        <div style="height: auto; width: auto; top: 0px; left: 0px; visibility: hidden; position: absolute; white-space: pre; font-style: inherit; font-variant: inherit; font-stretch: inherit; font-size: inherit; line-height: inherit; font-family: inherit; overflow: visible;">
                            XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
                        </div>
                    </div>
                </div>
                <div id="editor-css" class="playground-editor ace_editor ace-clouds"
                     style="height: 500px; display: block;" itemprop="sampleType" draggable="false"><textarea
                            class="ace_text-input" wrap="off" autocorrect="off" autocapitalize="off" spellcheck="false"
                            style="opacity: 0; height: 14px; width: 6.59781px; left: 221.945px; top: 468px;"></textarea>
                    <div class="ace_gutter">
                        <div class="ace_layer ace_gutter-layer ace_folding-enabled"
                             style="margin-top: -8px; height: 524px; width: 53px;">
                            <div class="ace_gutter-cell " style="height: 14px;">81</div>
                            <div class="ace_gutter-cell " style="height: 14px;">82</div>
                            <div class="ace_gutter-cell " style="height: 14px;">83</div>
                            <div class="ace_gutter-cell " style="height: 14px;">84</div>
                            <div class="ace_gutter-cell " style="height: 14px;">85</div>
                            <div class="ace_gutter-cell " style="height: 14px;">86<span
                                        class="ace_fold-widget ace_start ace_open" style="height: 14px;"></span></div>
                            <div class="ace_gutter-cell " style="height: 14px;">87</div>
                            <div class="ace_gutter-cell " style="height: 14px;">88</div>
                            <div class="ace_gutter-cell " style="height: 14px;">89</div>
                            <div class="ace_gutter-cell " style="height: 14px;">90</div>
                            <div class="ace_gutter-cell " style="height: 14px;">91</div>
                            <div class="ace_gutter-cell " style="height: 14px;">92</div>
                            <div class="ace_gutter-cell " style="height: 14px;">93</div>
                            <div class="ace_gutter-cell " style="height: 14px;">94<span
                                        class="ace_fold-widget ace_start ace_open" style="height: 14px;"></span></div>
                            <div class="ace_gutter-cell " style="height: 14px;">95</div>
                            <div class="ace_gutter-cell " style="height: 14px;">96</div>
                            <div class="ace_gutter-cell " style="height: 14px;">97</div>
                            <div class="ace_gutter-cell " style="height: 14px;">98</div>
                            <div class="ace_gutter-cell " style="height: 14px;">99</div>
                            <div class="ace_gutter-cell " style="height: 14px;">100<span
                                        class="ace_fold-widget ace_start ace_open" style="height: 14px;"></span></div>
                            <div class="ace_gutter-cell " style="height: 14px;">101</div>
                            <div class="ace_gutter-cell " style="height: 14px;">102</div>
                            <div class="ace_gutter-cell " style="height: 14px;">103</div>
                            <div class="ace_gutter-cell " style="height: 14px;">104</div>
                            <div class="ace_gutter-cell " style="height: 14px;">105</div>
                            <div class="ace_gutter-cell " style="height: 14px;">106</div>
                            <div class="ace_gutter-cell " style="height: 14px;">107</div>
                            <div class="ace_gutter-cell " style="height: 14px;">108<span
                                        class="ace_fold-widget ace_start ace_open" style="height: 14px;"></span></div>
                            <div class="ace_gutter-cell " style="height: 14px;">109</div>
                            <div class="ace_gutter-cell " style="height: 14px;">110</div>
                            <div class="ace_gutter-cell " style="height: 14px;">111</div>
                            <div class="ace_gutter-cell " style="height: 14px;">112</div>
                            <div class="ace_gutter-cell " style="height: 14px;">113<span
                                        class="ace_fold-widget ace_start ace_open" style="height: 14px;"></span></div>
                            <div class="ace_gutter-cell " style="height: 14px;">114</div>
                            <div class="ace_gutter-cell " style="height: 14px;">115</div>
                            <div class="ace_gutter-cell " style="height: 14px;">116</div>
                        </div>
                        <div class="ace_gutter-active-line" style="top: 468px; height: 14px;"></div>
                    </div>
                    <div class="ace_scroller" style="left: 53px; right: 17px; bottom: 0px;">
                        <div class="ace_content"
                             style="margin-top: -8px; width: 1244px; height: 524px; margin-left: 0px;">
                            <div class="ace_layer ace_print-margin-layer">
                                <div class="ace_print-margin" style="left: 531.825px; visibility: visible;"></div>
                            </div>
                            <div class="ace_layer ace_marker-layer"></div>
                            <div class="ace_layer ace_text-layer" style="padding: 0px 4px;">
                                <div class="ace_line" style="height:14px"><span
                                            class="ace_support ace_type">outline</span>:<span
                                            class="ace_support ace_constant">none</span>;
                                </div>
                                <div class="ace_line" style="height:14px"><span
                                            class="ace_support ace_type">width</span>:<span
                                            class="ace_constant ace_numeric">100</span><span
                                            class="ace_keyword">%</span>;
                                </div>
                                <div class="ace_line" style="height:14px"><span
                                            class="ace_support ace_type">margin</span>:<span
                                            class="ace_constant ace_numeric">8</span><span class="ace_keyword">px</span>
                                    <span class="ace_constant ace_numeric">0</span>;
                                </div>
                                <div class="ace_line" style="height:14px"></div>
                                <div class="ace_line" style="height:14px"><span class="ace_paren ace_rparen">}</span>
                                </div>
                                <div class="ace_line" style="height:14px"><span
                                            class="ace_variable">.sa-innate-form</span> <span
                                            class="ace_constant">input</span>[<span
                                            class="ace_constant">type</span>=<span
                                            class="ace_constant">submit</span>]<span
                                            class="ace_paren ace_lparen">{</span></div>
                                <div class="ace_line" style="height:14px"><span
                                            class="ace_support ace_type">border</span>:<span
                                            class="ace_constant ace_numeric">1</span><span class="ace_keyword">px</span>
                                    <span class="ace_support ace_constant">solid</span><span
                                            class="ace_constant ace_numeric">#e64b3b</span>;
                                </div>
                                <div class="ace_line" style="height:14px"><span
                                            class="ace_support ace_type">background</span>:<span
                                            class="ace_constant ace_numeric">#e64b3b</span>;
                                </div>
                                <div class="ace_line" style="height:14px"><span
                                            class="ace_support ace_type">color</span>:<span
                                            class="ace_constant ace_numeric">#fff</span>;
                                </div>
                                <div class="ace_line" style="height:14px"><span
                                            class="ace_support ace_type">padding</span>:<span
                                            class="ace_constant ace_numeric">10</span><span
                                            class="ace_keyword">px</span> <span
                                            class="ace_constant ace_numeric">25</span><span
                                            class="ace_keyword">px</span>;
                                </div>
                                <div class="ace_line" style="height:14px"><span
                                            class="ace_support ace_type">font-size</span>:<span
                                            class="ace_constant ace_numeric">14</span><span
                                            class="ace_keyword">px</span>;
                                </div>
                                <div class="ace_line" style="height:14px"><span
                                            class="ace_support ace_type">margin-top</span>:<span
                                            class="ace_constant ace_numeric">5</span><span class="ace_keyword">px</span>;
                                </div>
                                <div class="ace_line" style="height:14px"><span class="ace_paren ace_rparen">}</span>
                                </div>
                                <div class="ace_line" style="height:14px"><span
                                            class="ace_variable">.sa-innate-form</span> <span
                                            class="ace_constant">input</span>[<span
                                            class="ace_constant">type</span>=<span
                                            class="ace_constant">submit</span>]<span
                                            class="ace_string">:hover</span><span class="ace_paren ace_lparen">{</span>
                                </div>
                                <div class="ace_line" style="height:14px"><span
                                            class="ace_support ace_type">border</span>:<span
                                            class="ace_constant ace_numeric">1</span><span class="ace_keyword">px</span>
                                    <span class="ace_support ace_constant">solid</span><span
                                            class="ace_constant ace_numeric">#db3b2b</span>;
                                </div>
                                <div class="ace_line" style="height:14px"><span
                                            class="ace_support ace_type">background</span>:<span
                                            class="ace_constant ace_numeric">#db3b2b</span>;
                                </div>
                                <div class="ace_line" style="height:14px"><span
                                            class="ace_support ace_type">color</span>:<span
                                            class="ace_constant ace_numeric">#fff</span>;
                                </div>
                                <div class="ace_line" style="height:14px"><span class="ace_paren ace_rparen">}</span>
                                </div>
                                <div class="ace_line" style="height:14px"></div>
                                <div class="ace_line" style="height:14px"><span
                                            class="ace_variable">.sa-innate-form</span> <span class="ace_constant">button</span><span
                                            class="ace_paren ace_lparen">{</span></div>
                                <div class="ace_line" style="height:14px"><span
                                            class="ace_support ace_type">border</span>:<span
                                            class="ace_constant ace_numeric">1</span><span class="ace_keyword">px</span>
                                    <span class="ace_support ace_constant">solid</span><span
                                            class="ace_constant ace_numeric">#e64b3b</span>;
                                </div>
                                <div class="ace_line" style="height:14px"><span
                                            class="ace_support ace_type">background</span>:<span
                                            class="ace_constant ace_numeric">#e64b3b</span>;
                                </div>
                                <div class="ace_line" style="height:14px"><span
                                            class="ace_support ace_type">color</span>:<span
                                            class="ace_constant ace_numeric">#fff</span>;
                                </div>
                                <div class="ace_line" style="height:14px"><span
                                            class="ace_support ace_type">padding</span>:<span
                                            class="ace_constant ace_numeric">10</span><span
                                            class="ace_keyword">px</span> <span
                                            class="ace_constant ace_numeric">25</span><span
                                            class="ace_keyword">px</span>;
                                </div>
                                <div class="ace_line" style="height:14px"><span
                                            class="ace_support ace_type">font-size</span>:<span
                                            class="ace_constant ace_numeric">14</span><span
                                            class="ace_keyword">px</span>;
                                </div>
                                <div class="ace_line" style="height:14px"><span
                                            class="ace_support ace_type">margin-top</span>:<span
                                            class="ace_constant ace_numeric">5</span><span class="ace_keyword">px</span>;
                                </div>
                                <div class="ace_line" style="height:14px"><span class="ace_paren ace_rparen">}</span>
                                </div>
                                <div class="ace_line" style="height:14px"><span
                                            class="ace_variable">.sa-innate-form</span> <span class="ace_constant">button</span><span
                                            class="ace_string">:hover</span><span class="ace_paren ace_lparen">{</span>
                                </div>
                                <div class="ace_line" style="height:14px"><span
                                            class="ace_support ace_type">border</span>:<span
                                            class="ace_constant ace_numeric">1</span><span class="ace_keyword">px</span>
                                    <span class="ace_support ace_constant">solid</span><span
                                            class="ace_constant ace_numeric">#db3b2b</span>;
                                </div>
                                <div class="ace_line" style="height:14px"><span
                                            class="ace_support ace_type">background</span>:<span
                                            class="ace_constant ace_numeric">#db3b2b</span>;
                                </div>
                                <div class="ace_line" style="height:14px"><span
                                            class="ace_support ace_type">color</span>:<span
                                            class="ace_constant ace_numeric">#fff</span>;
                                </div>
                                <div class="ace_line" style="height:14px"><span class="ace_paren ace_rparen">}</span>
                                </div>
                                <div class="ace_line" style="height:14px"><span
                                            class="ace_variable">.sa-innate-form</span> <span
                                            class="ace_constant">p</span><span class="ace_paren ace_lparen">{</span>
                                </div>
                                <div class="ace_line" style="height:14px"><span class="ace_indent-guide">    </span>
                                    <span class="ace_support ace_type">font-size</span>:<span
                                            class="ace_constant ace_numeric">13</span><span
                                            class="ace_keyword">px</span>;
                                </div>
                                <div class="ace_line" style="height:14px"><span class="ace_indent-guide">    </span>
                                    <span class="ace_support ace_type">padding-top</span>:<span
                                            class="ace_constant ace_numeric">10</span><span
                                            class="ace_keyword">px</span>;
                                </div>
                                <div class="ace_line" style="height:14px"><span class="ace_paren ace_rparen">}</span>
                                </div>
                            </div>
                            <div class="ace_layer ace_marker-layer"></div>
                            <div class="ace_layer ace_cursor-layer ace_hidden-cursors">
                                <div class="ace_cursor"
                                     style="left: 168.945px; top: 476px; width: 6.59781px; height: 14px;"></div>
                            </div>
                        </div>
                    </div>
                    <div class="ace_scrollbar ace_scrollbar-v" style="width: 22px; bottom: 0px;">
                        <div class="ace_scrollbar-inner" style="width: 22px; height: 1624px;"></div>
                    </div>
                    <div class="ace_scrollbar ace_scrollbar-h"
                         style="display: none; height: 22px; left: 53px; right: 17px;">
                        <div class="ace_scrollbar-inner" style="height: 22px; width: 1244px;"></div>
                    </div>
                    <div style="height: auto; width: auto; top: 0px; left: 0px; visibility: hidden; position: absolute; white-space: pre; font: inherit; overflow: hidden;">
                        <div style="height: auto; width: auto; top: 0px; left: 0px; visibility: hidden; position: absolute; white-space: pre; font: inherit; overflow: visible;"></div>
                        <div style="height: auto; width: auto; top: 0px; left: 0px; visibility: hidden; position: absolute; white-space: pre; font-style: inherit; font-variant: inherit; font-stretch: inherit; font-size: inherit; line-height: inherit; font-family: inherit; overflow: visible;">
                            XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
                        </div>
                    </div>
                    <div class="ace_tooltip" style="display: none; left: 69px; top: 225px;">Expected (none | right |
                        left | both | inherit) but found 'fix'.
                    </div>
                </div>
                <div id="editor-js" class="playground-editor ace_editor ace-clouds"
                     style="height: 500px; display: none;" itemprop="sampleType"><textarea class="ace_text-input"
                                                                                           wrap="off" autocorrect="off"
                                                                                           autocapitalize="off"
                                                                                           spellcheck="false"
                                                                                           style="opacity: 0; height: 14px; width: 6.59781px; left: 44px; top: 0px;"></textarea>
                    <div class="ace_gutter">
                        <div class="ace_layer ace_gutter-layer ace_folding-enabled"
                             style="margin-top: 0px; height: 524px; width: 40px;">
                            <div class="ace_gutter-cell " style="height: 14px;">1</div>
                        </div>
                        <div class="ace_gutter-active-line" style="top: 0px; height: 14px;"></div>
                    </div>
                    <div class="ace_scroller" style="left: 40px; right: 0px; bottom: 0px;">
                        <div class="ace_content"
                             style="margin-top: 0px; width: 1829px; height: 524px; margin-left: 0px;">
                            <div class="ace_layer ace_print-margin-layer">
                                <div class="ace_print-margin" style="left: 531.825px; visibility: visible;"></div>
                            </div>
                            <div class="ace_layer ace_marker-layer"></div>
                            <div class="ace_layer ace_text-layer" style="padding: 0px 4px;">
                                <div class="ace_line" style="height:14px"></div>
                            </div>
                            <div class="ace_layer ace_marker-layer"></div>
                            <div class="ace_layer ace_cursor-layer ace_hidden-cursors">
                                <div class="ace_cursor"
                                     style="left: 4px; top: 0px; width: 6.59781px; height: 14px;"></div>
                            </div>
                        </div>
                    </div>
                    <div class="ace_scrollbar ace_scrollbar-v" style="display: none; width: 22px; bottom: 0px;">
                        <div class="ace_scrollbar-inner" style="width: 22px; height: 14px;"></div>
                    </div>
                    <div class="ace_scrollbar ace_scrollbar-h"
                         style="display: none; height: 22px; left: 40px; right: 0px;">
                        <div class="ace_scrollbar-inner" style="height: 22px; width: 1869px;"></div>
                    </div>
                    <div style="height: auto; width: auto; top: 0px; left: 0px; visibility: hidden; position: absolute; white-space: pre; font: inherit; overflow: hidden;">
                        <div style="height: auto; width: auto; top: 0px; left: 0px; visibility: hidden; position: absolute; white-space: pre; font: inherit; overflow: visible;"></div>
                        <div style="height: auto; width: auto; top: 0px; left: 0px; visibility: hidden; position: absolute; white-space: pre; font-style: inherit; font-variant: inherit; font-stretch: inherit; font-size: inherit; line-height: inherit; font-family: inherit; overflow: visible;">
                            XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<div class="container">
    <div class="row">
        <div class="col-md-4 col-md-offset-4">
            <div class="form-body">
                <ul class="nav nav-tabs final-login">
                    <li class="active"><a data-toggle="tab" href="#sectionA">Sign In</a></li>
                    <li><a data-toggle="tab" href="#sectionB">Join us!</a></li>
                </ul>
                <div class="tab-content">
                    <div id="sectionA" class="tab-pane fade in active">
                        <div class="innter-form">
                            <form class="sa-innate-form" method="post">
                                <label>Email Address</label>
                                <input type="text" name="username">
                                <label>Password</label>
                                <input type="password" name="password">
                                <button type="submit">Sign In</button>
                                <a href="">Forgot Password?</a>
                            </form>
                        </div>
                        <div class="social-login">
                            <p>- - - - - - - - - - - - - Sign In With - - - - - - - - - - - - - </p>
                            <ul>
                                <li><a href=""><i class="fa fa-facebook"></i> TipaVK</a></li>
                            </ul>
                        </div>
                        <div class="clearfix"></div>
                    </div>
                    <div id="sectionB" class="tab-pane fade">
                        <div class="innter-form">
                            <form class="sa-innate-form" method="post">
                                <label>Name</label>
                                <input type="text" name="username">
                                <label>Email Address</label>
                                <input type="text" name="username">
                                <label>Password</label>
                                <input type="password" name="password">
                                <button type="submit">Join now</button>
                                <p>By clicking Join now, you agree to hifriends's User Agreement, Privacy Policy, and
                                    Cookie Policy.</p>
                            </form>
                        </div>
                        <div class="social-login">
                            <p>- - - - - - - - - - - - - Register With - - - - - - - - - - - - - </p>
                            <ul>
                                <li><a href=""><i class="fa fa-facebook"></i> TipaVK</a></li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>