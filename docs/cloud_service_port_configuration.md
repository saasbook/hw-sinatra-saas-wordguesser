Rackup is one app that relies on ports being opened to serve pages.  If you want to use it or similar on cloud systems such as Cloud9 or Codio you'll need to add command switches as shown below:

##### Cloud9 operation

If you're using Cloud9, you should use this command line:

```sh
$ bundle exec rackup -p $PORT -o $IP
```
[Available ports on a hosted Cloud9 workspace](https://docs.c9.io/docs/run-an-application)

##### Codio operation

If you're using Codio, you should use this command line:

```sh
$ bundle exec rackup --host 0.0.0.0 -p 3000
```

and click on the Codio "Project Index (static)" drop down and select "Box URL" in order to access 
