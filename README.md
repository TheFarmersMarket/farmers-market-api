<h1>Farmer's Market</h1>

<p>API endpoint: <strong>https://tiy-farmers-market.herokuapp.com</strong></p>

<h2>Create a User</h2>

`<h5>Request:</h5>`

`POST /users`

```json
"user": {
  "email": "you@domain.com",
  "password": "8charsMinimum"
  }
```
`<h5>Response:</h5>`

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
