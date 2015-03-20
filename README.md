#Farmer's Market

###API endpoint: <strong>https://tiy-farmers-market.herokuapp.com</strong></p>

#Create a User

#####Request:

`POST /users`

```json
"user": {
  "email": "you@domain.com",
  "password": "8charsMinimum",
  "profile_type": "farmer or customer"
  }
```
#####Response:
######Returns farmer or customer id at the bottom of the response

`Status: 201 Created`

creates a new user and resturns an authentication token.
```json
{
    "user": {
        "id": 25,
        "email": "another187@user.com",
        "authentication_token": "auth-token-here",
        "profile_type": "farmer",
        "farmer_id": 7
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
        "authentication_token": "a4enoRUA4GpVGHTEhEZc",
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
# Delete Farmer

### /farmers/:id DELETE

##### Mandatory Params
* auth_token

`Response:`
`Status: 200 OK`
```
{
    "farmer": "Farmer was deleted"
}

```

# Show Customer

### /customers/:id GET

##### Response:
`Status: 200 OK`
```
{
    "customer": {
        "id": 1,
        "created_at": "2015-03-12T18:12:24.987Z",
        "updated_at": "2015-03-12T20:34:28.108Z",
        "location": "Atlanta",
        "business_phone": "444-555-6666",
        "business": "longhorn",
        "contact_name": "Bob",
        "user_id": 7
    }
}
```

# Edit Customer Profile

### /customers/:id PUT

###### Optional Params
* customer: {location: location, business_phone: business_phone, business: business, contact_name: contact_name}

###### Response:
`Status: 200 OK`
```

{
    "customer": {
        "id": 1,
        "created_at": "2015-03-12T18:12:24.987Z",
        "updated_at": "2015-03-12T20:34:28.108Z",
        "location": "Atlanta",
        "business_phone": "444-555-6666",
        "business": "longhorn",
        "contact_name": "Bob",
        "user_id": 7
    }
}
```
# Delete customer

### /customer/:id DELETE

##### Mandatory Params
* auth_token

`Response:`
`Status: 200 OK`
```
{
    "customer": "customer was deleted"
}

```

#Update Password

#####Request:
##### Required Params
* auth_token - passed in headers
* password
* password_confirmation

`PUT /users/password`

```json
"header" {
  "auth-token": "auth-token-goes-here",
}

"user": {
  "password": "NewPassword8charsMinimum",
  "password_confirmation": "NewPassword8charsMinimum"
  }
```
#####Response:

`Status: 200 OK`

creates a new user and returns an authentication token.
```json
{
    "user": {
        "id": 5,
        "email": "b@b.com",
        "authentication_token": "3-3UyCnsEv2yh2v2gB6t",
        "profile_type": "farmer"
    }
}
```

#Create a Crop

#####Request:

`POST /crops`

```json
"crop": {
  "price": "100.00 per bushel",
  "currency": "USD",
  "quantity": "50 bushels",
  "crop_name": "corn"
  }
```
#####Response:
######Returns crop info with farmer_id

`Status: 201 Created`

creates a new crop 
```json
{
    "crop": {
        "id": 1,
        "price": "100.00 per bushel",
        "currency": "USD",
        "quantity": "50 bushels",
        "crop_name": "corn",
        "farmer_id": 7
    }
}
```
# Show Crop

### /farmers/:farmer_id/crops GET

##### Response:
`Status: 200 OK`
```
{
    "crops": [
        {
            "id": 37,
            "farmer_id": 33,
            "price": "14.40",
            "currency": "$USD",
            "quantity": "587",
            "crop_name": "potatoes"
        },
        {
            "id": 23,
            "farmer_id": 33,
            "price": "37.33",
            "currency": "$USD",
            "quantity": "509",
            "crop_name": "wheat"
        },
        {
            "id": 41,
            "farmer_id": 33,
            "price": "94.75",
            "currency": "$USD",
            "quantity": "367",
            "crop_name": "strawberries"
        }
    ]
}
```

# Edit Crops

### /crops/:id PUT

###### Response:
`Status: 200 OK`
```

{
    "crop": {
        "id": 1,
        "created_at": "2015-03-12T18:12:24.987Z",
        "updated_at": "2015-03-12T20:34:28.108Z",
        "farmer_id": 2,
        "price": "100.00",
        "currency": "USD",
        "quantity": "250",
        "crop_name": "corn",
    }
}
```

# Delete Crop

### /crop/:id DELETE

`Response:`
`Status: 200 OK`
```
{
    "crop": "crop was deleted"
}
```

# Search 

##### Required Params
* auth-token - passed in headers
* query - crop name, business contact name, location, etc..

#####Request:

`GET /searches/search`

```json
  {
  "query": "corn",
  "auth-token": "auth-token-here"
  }
```

##### Response:
`Status: 200 OK`
```
{
    "search": [
        {
            "result_id": 2,
            "result_type": "Farmer",
            "result_match": "(770) 712-6789 Atlanta Farms cotton, corn ",
            "result_url": "/farmers/2"
        },
        {
            "result_id": 28,
            "result_type": "Crop",
            "result_match": "Corn",
            "result_url": "/crops/28"
        }
    ]
}
```
