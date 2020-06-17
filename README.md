## Ruby on Rails API
* Ruby on Rails API for the Be Engaged backend.
* This API consists of 4 domain models with `has_many` and `belongs_to` associations.
* Pulls in election and polling station data from [Google Civic Information API](https://developers.google.com/civic-information/docs/using_api).
* Developed SMS notification feature with the [Twilio API](https://www.twilio.com/).
* Built by [Stephanie Zou](https://github.com/stephaniezou1).

## Getting Started

To get started, you will only need Ruby on Rails and Postgres. To do so, you must have Homebrew and Ruby installed first.

### Node installation on OS X

In your terminal...

1. Install [Homebrew](https://brew.sh/)

    ```$ /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"```
  
2. Install [Ruby](https://www.ruby-lang.org/en/)
    
    ```$ brew install ruby```

3. Install [Rails](https://rubyonrails.org/)

    ```$ gem install rails```

4. Install [PostgreSQL](https://www.postgresql.org/)

    ```$ brew install postgresql```


## Installation

1. Clone the repo and cd into the folder
2. Bundle Install

    ```$ bundle install```
    
3. Create migrations, migrate and seed:

    ```
    $ rails db:create
    $ rails db:migrate
    $ rails db:seed
## Launch The Server

1. Last step, launch the rails server!
    ```$ rails s```
    
    ### Start developing!


## Tools

* [Rack CORS](https://github.com/cyu/rack-cors): description
* [ActiveModel::Serializer](https://github.com/rails-api/active_model_serializers): description
* [Google Civic Information API](https://developers.google.com/civic-information/docs/using_api)
* [Twilio API](https://www.twilio.com/)

## Live demo
Coming soon!
