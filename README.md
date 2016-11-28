## Getting started

To get started with the app, clone the repo and then install the needed gems:

```
$ bundle install --without production
```

Next, migrate the database:

```
$ rails db:migrate
```

Then, populate the database:

```
$ rails db:seed
```

Finally, run thee app in a local server:

```
$ rails server
```
