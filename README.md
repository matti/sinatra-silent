# sinatra-silent

Silences Sinatra

    set :silent_sinatra, true
    set :silent_webrick, true
    set :silent_access_log, true

    # or

    set :silent_all, true

## development

    rake
    rake parallel:spec
