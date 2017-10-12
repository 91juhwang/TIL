# GraphQL

A GraphQL service is created by defining types and fields on those types, then providing functions for each field on each type. For example, a GraphQL service that tells us who the logged in user is (me) as well as that user's name might look something like this:

```es6
type Query {
  me: User
}

type User {
  id: ID
  name: String
}
```

## Queries and Mutations

