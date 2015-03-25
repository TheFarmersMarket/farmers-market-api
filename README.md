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
  },
    "avatar": {
      "avatar": "image url"
    }
}
```
# Farmers Follower Count
### /farmers/:id/follower_count GET
##### Required Params
* auth-token - passed in headers

###### Response: 
`Status: 201 Created`
```
{
    "follower_count": {
        "follower_count": 1
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
  },
    "avatar": {
      "avatar": "image url"
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
  "crops": {
    "id": 37,
      "farmer_id": 33,
      "price": "14.40",
      "currency": "$USD",
      "quantity": "587",
      "crop_name": "potatoes"
  }
  "avatar": {
    "avatar": "image url"
  },
    {
      "id": 23,
      "farmer_id": 33,
      "price": "37.33",
      "currency": "$USD",
      "quantity": "509",
      "crop_name": "wheat"
    }
  "avatar": {
    "avatar": "image url"
  },
    {
      "id": 41,
      "farmer_id": 33,
      "price": "94.75",
      "currency": "$USD",
      "quantity": "367",
      "crop_name": "strawberries"
    }
  "avatar": {
    "avatar": "image url"
  }
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
  "auth-token": "auth-token-here"
}

{
  "query": "runte"
}
```

##### Response:
`Status: 200 OK`
```
{
  "search": [
  {
    "customer_id": 15,
      "contact_name": "Hal Will",
      "business": "Runte LLC",
      "url": "/customers/15"
  },
  {
    "farmer_id": 36,
    "contact_name": "Maritza Schaefer",
    "farm": "Runte Inc",
    "url": "/farmers/36"
  },
  {
    "farmer_id": 57,
    "contact_name": "Margarita Kuhn MD",
    "farm": "Runte-Kutch",
    "url": "/farmers/57"
  }
  ]
}
```

# Create Avatar for Farmer

### /farmers/:farmer_id/pic PUT

###### Responese:
`Status: 201 Created`
```

{
  "avatar": "image url"
}

```

# Create Avatar for Customer

### /customers/:customer_id/pic PUT

###### Responese:
`Status: 201 Created`
```

{
  "avatar": "image url"
}

```
# Follow Farmer
### /customers/:id/follow POST
##### Required Params
* auth-token - passed in headers
* farmer[id]

###### Response:
`Status: 201 Created`
```
{
  "follow": {
    "farmer_id": 34,
      "farmer_name": "Miss Marilyne Wyman",
      "farmer_followers_count": 1,
      "customer_id": 62,
      "customer_name": Tiger Woods,
      "customer_follow_count": 12
  }
}
```

# Unfollow Farmer
### /customers/:id/unfollow PUT
##### Required Params
* auth-token - passed in headers
* farmer[id]

###### Response:
`Status: 200 OK`
```

{
    "unfollow": {
        "message": "Customer no longer follow farmer",
        "customer_id": 2,
        "customer_name": "Estell Howe",
        "customer_follow_count": 0
    }
}
```

# Get Customer Follows
### /customers/:id/all_following GET
##### Required Params
* auth-token - passed in headers
* farmer[id]

###### Response: 
`Status: 200 OK`
```
{
    "all_following": [
        {
            "farmer_id": 6,
            "farm": "Goldner Inc",
            "contact_name": "Miss Gregoria Wisoky"
        },
        {
            "farmer_id": 2,
            "farm": "Towne, Harber and Kris",
            "contact_name": "Francisco Hilll"
        },
        {
            "farmer_id": 4,
            "farm": "Corkery Inc",
            "contact_name": "Maye Yost Sr."
        }
    ]
}
```

# Create Picture For Crops

### /crops/:crop_id/pic PUT

###### Responese:
`Status: 201 Created`
```

{
  "avatar": "image url"
}

```

# Delete User

### /users DELETE

##### Mandatory Params
* auth_token

`Response:`
`Status: 200 OK`
```
{
  "message": "User was deleted"
}

```

# Farmer Profile Page

### /farmers/:farmer_id/profile GET

`Response:`
`Status: 200 OK`
```
{
  "farmer": {
    "id": 54,
    "location": "Atlanta, GA",
    "business_phone": "(770 712-6287",
    "farm": "Spencer's Farm",
    "crop_names": "white corn, blackberries, carrots",
    "contact_name": "Spencer Wyckoff",
    "user_id": 70
    "email": "string"
  },
  "crops": [
  {
    "id": 40,
    "farmer_id": 54,
    "price": "0.89",
    "currency": "USD",
    "quantity": "131 bushels",
    "crop_name": "Carrots",
    "avatar": "/images/original/missing.png"
    },
    {
      "id": 41,
      "farmer_id": 54,
      "price": "3.23",
      "currency": "USD",
      "quantity": "37 bushels",
      "crop_name": "blackberries",
      "avatar": "/images/original/missing.png"
      },
      {
        "id": 42,
        "farmer_id": 54,
        "price": "1.23",
        "currency": "USD",
        "quantity": "13",
        "crop_name": "blackberries",
        "avatar": "/images/original/missing.png"
        }
        ],
        "avatar": {
          "avatar": "/images/medium/missing.png"
          }
}
```
