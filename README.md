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

# Show Farmer

### /farmers/:id GET
##### Response:
`Status: 200 OK`
```
{
    "farmer": {
        "id": 1,
        "created_at": "2015-03-12T18:12:24.987Z",
        "updated_at": "2015-03-12T20:34:28.108Z",
        "location": "Atlanta",
        "business_phone": "444-555-6666",
        "farm": "Farm name",
        "crop_names": "wheat",
        "contact_name": "Bob the farmer",
        "user_id": 7
    }
}
```

# Edit Farmer Profile

### /farmers/:id PUT

###### Optional Params
* farmer: {location: location, business_phone: business_phone, farm: farm, crop_names: crop_names, contact_phone: contact_phone }

###### Response:
`Status: 200 OK`
```

{
    "farmer": {
        "id": 1,
        "created_at": "2015-03-12T18:12:24.987Z",
        "updated_at": "2015-03-12T20:34:28.108Z",
        "location": "Atlanta",
        "business_phone": "444-555-6666",
        "farm": "Farm name",
        "crop_names": "wheat",
        "contact_name": "Bob the farmer",
        "user_id": 7
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

