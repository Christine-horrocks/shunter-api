# SHUNTER API

Clone both repos

```
$ git clone https://github.com/Christine-horrocks/shunter-api.git
$ git clone https://github.com/Christine-horrocks/shunter-prototype.git
```

Change into them in separate terminal windows or tabs, change to the `development` branch, install dependencies and run the apps

```
$ cd shunter-api
$ git checkout development
$ bundle install
$ bundle exec rails s
```
```
$ cd shunter-prototype
$ git checkout development
$ npm install
$ npm cache clean --force && node app.js
```

For the backend, visit [localhost:3000](localhost:3000).
For the frontend, visit [localhost:5400](localhost:5400).