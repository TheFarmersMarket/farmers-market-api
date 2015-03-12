#Farmer's Market

###API endpoint: <strong>https://tiy-farmers-market.herokuapp.com</strong></p>

#Create a User

#####Request:

`POST /users`

```json
"user": {
  "email": "you@domain.com",
  "password": "8charsMinimum"
  "profile_type": "farmer or customer"
  }
```
#####Response:

`Status: 201 Created`

creates a new user and resturns an authentication token.
```json
{
    "user": {
        "id": 3,
        "email": "fake@fake.com",
        "authentication_token": "GRW2KfrvLRRqdiXiEHSb"
        "profile_type": "farmer or customer"
    }
}
```

#Sign In a User

#####Request:

`POST /users/sign_in`

```json
"user": {
  "email": "you@domain.com",
  "password": "8charsMinimum"
  }
```
#####Response:

`Status: 200 OK`

creates a new user and resturns an authentication token.
```json
{
    "user": {
        "id": 4,
        "email": "not@real.com",
        "authentication_token": "a4enoRUA4GpVGHTEhEZc"
        "profile_type": "farmer or customer"
    }
}
```

#Update Password

#####Request:

`PUT /users/password`

```json
"user": {
  "email": "you@domain.com",
  "password": "NewPassword8charsMinimum"
  }
```
#####Response:

`Status: 200 OK`

creates a new user and resturns an authentication token.
```json
{
    "user": {
        "id": 5,
        "email": "b@b.com",
        "authentication_token": "3-3UyCnsEv2yh2v2gB6t"
    }
}
```

