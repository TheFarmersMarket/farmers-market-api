<h1>Farmer's Market</h1>

<p>API endpoint: <strong>https://farmersmarket.herokuapp.com</strong></p>

<h2>Create a User</h2>

`<h5>Request:</h5>`

`POST /users`

```json
"user": {
  "email": "you@domain.com",
  "password": "password"
  }
```
`<h5>Response:</h5>`

`Status: 201 Created`

creates a new user and resturns an authentication token.
```json
{
"user": {
  "email": "you@domain.com",
  "authentication_token": "string",
  "id": integer
  }
}
