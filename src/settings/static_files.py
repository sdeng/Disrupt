import os

# Our django-pipeline settings
DJANGO_PATH = os.path.normpath(os.path.abspath(os.path.dirname(__file__)) + '/../')
PIPELINE_COMPILERS = (
    'pipeline.compilers.coffee.CoffeeScriptCompiler',
    'pipeline.compilers.less.LessCompiler',
)

PIPELINE_CSS_COMPRESSOR = None
PIPELINE_JS_COMPRESSOR = None
PIPELINE_LESS_BINARY          = os.path.join(DJANGO_PATH, '../node_modules/less/bin/lessc')
PIPELINE_COFFEE_SCRIPT_BINARY = os.path.join(DJANGO_PATH, '../node_modules/coffee-script/bin/coffee')
STATICFILES_STORAGE = 'pipeline.storage.PipelineCachedStorage'

PIPELINE_CSS = {
    'admin': {
        'source_filenames': (
            "less/admin.less",
        ),
        'output_filename': 'css/admin.css',
    },
    'application': {
        'source_filenames': (
            "css/angular-growl.min.css",
            "less/all.less",
        ),
        'output_filename': 'css/all.css',
    },
    'login': {
        'source_filenames': (
        ),
        'output_filename': 'css/login.css',
    },
}

PIPELINE_JS = {
    'application': {
        'source_filenames': (
            "js/respond.min.js",
            "js/bootstrap.min.js",
            "js/angular-cookie.js",
            "js/angular-growl.js",
            "js/angular-sticky.js",
            "coffeescript/common/init.coffee",
            "coffeescript/common/router.coffee",
            "coffeescript/services/user.coffee",
            "coffeescript/resources/user.coffee",
            "coffeescript/controllers/confirm_invite.coffee",
            "coffeescript/controllers/home.coffee",
            "coffeescript/controllers/invite_client.coffee",
            "coffeescript/controllers/login.coffee",
            "coffeescript/controllers/landing_page.coffee",
            "coffeescript/controllers/goal.coffee",
            "coffeescript/controllers/doctor.coffee",
        ),
        'output_filename': 'js/application.js',
    },
}



