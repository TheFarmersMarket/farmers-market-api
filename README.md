#Farmer's Market

###API endpoint: <strong>https://tiy-farmers-market.herokuapp.com</strong></p>

#Create a User

#####Request:

`POST /users`

```json
"user": {
  "email": "you@domain.com",
  "password": "8charsMinimum"
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
    }
}
