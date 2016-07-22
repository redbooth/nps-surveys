NPS Surveys [![Gem](https://img.shields.io/gem/dtv/nps_surveys.svg?maxAge=2592000)](https://rubygems.org/gems/nps_surveys) <a href='http://redbooth.com' target='_blank'>![](https://www.dropbox.com/s/qo4yp1tpbsvqfya/made-at-redbooth-blue.svg?dl=1)</a>
==============================================================================
This engine adds 2 new API endpoints to store and consume NPS user responses.
You can then analyze this information with the SQL queries listed below.

https://gist.github.com/sonnenjon/bbab857e7d42eb381b33b8c20d41a47c

Requirements
------------------------------------------------------------------------------

* Rails
* Rspec (for development)

Installation
------------------------------------------------------------------------------
This engine expects that you have a `users`  table which will be used to associate the nps response
with the user that filled it.

1. Add this line to you Gemfile
```
gem 'nps_surveys', '0.0.1'
```

2. Run migrations
```
bundle exec db:migrate
```

Now you have a working route to send NPS surveys responses.

Usage
------------------------------------------------------------------------------
With the default configuration

**index**
```
GET /api/internal/nps_surveys/responses
```

Will return a json with the responses of every survey of the user.

**create**
```
POST /api/internal/nps_surveys/responses
```

with params:
- **score**: The score selected by the user.
- **feedback**: Free text submitted by the user.
- **survey**: The indentifier of the survey.

Will create a response for that user.

Customization
------------------------------------------------------------------------------

You can customize several aspects of the engine behavior.

**controller_parent_class** This can be changed if you want the endpoint to inherit from something
that is not ``::ApplicationController``

**route_namespace** The route namespace to be used for the endpoint

**route_path** The route path to be used for the endpoint

**route_scope** The route scope to be used for the endpoint

**current_user** A lambda function that returns the current connected user when is executed in the context
of a the controller.

Default values are:

```
NpsSurveys.controller_parent_class = ::ApplicationController
NpsSurveys.route_namespace = :api_internal
NpsSurveys.route_path = 'api/internal'
NpsSurveys.current_user = lambda { self.current_user }
```

If you need to change any of those, create an initializer in the application overwriting them


