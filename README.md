This a simple to use application to maintain system user passwords and the security roles each user may possess.

Awesome Admin:

* allows the application user to change a users password.

* displays the list of users in a table form with an indicator in the appropriate cell to show a user possesses a role.

## Setup
You can run rake db:seed to get 3 test users.

```
rake db:seed
```

You might not want all the gems (autotest etc.) to get the tests running.


## Command Line Interface
```
thor admin:listusers       # displays a list of users
thor admin:updatepassword  # finds user with username and changes password
```

## Testing
I wrote model specs and request specs. The CLI uses Thor and is essentially just a wrapper around the User methods, so I didn't include tests for it.