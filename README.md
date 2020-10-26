# README

## Installation

These instructions were created by using Linux OS(Ubuntu MATE 16.04) & rbenv [How To Install Ruby on Rails](https://www.digitalocean.com/community/tutorials/how-to-install-ruby-on-rails-with-rbenv-on-ubuntu-14-04)

Check java on your machine

    java -version

If java is not present, download the JDK

    http://www.oracle.com/technetwork/java/javase/downloads/jdk8-downloads-2133151.html


We need to install JRuby 9.X (check ~/.ruby-version)

    rbenv install `cat .ruby-version`

You should get a result such as:

    -> Installed jruby-9.2.5.0 to /home/user/.rbenv/versions/jruby-9.2.5.0

Clone the repository:

    git clone https://github.com/zahraj3/oict.git
    cd oict

If jruby is installed, you should be able install gems:

    bundle

Before you run the application for the first, you need to 'uncomment' some configuration. Copy these files:

    cp config/database.yml.example config/database.yml

You can check if those files were copied succesfully and also check for setting inside them.

If database is configured correctly, you can setup database for the application and run.

    rake db:setup

After all this, you should be able start up application on your local:

    rails server

- which should be accesable on tcp://127.0.0.1:3000 by default


## Run appliaction
Run application:

```
rails s
```

Run tests

```
DDSDFDSDDDDDDDDDDDDDDDDDDDDDDDD
```

## Checking of mission goals

### 1) Check that App is running:

Endpoint definition

Try it:
```
curl http://127.0.0.1:3000/api/state
```

### 2) and 3) Getting information about a card (with basic authentication)

Endpoint Definition

HTTP Auth:

```
user: oict
pass: secret
```

Try it:

```
curl --user oict:secret 'http://127.0.0.1:3000/api/card_info?cln_or_id=123'
```


