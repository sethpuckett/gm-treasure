# GM Tools: Treasure API

The Treasure API is used to generate treasure hauls in role playing games. These can be rewards for winning battles, opening chests, etc. It is part of the [GM Tools](https://github.com/sethpuckett/gm-tools-docker) suite of services. See that repository for setup instructions.

## Endpoints

- `GET /treasure/individual`: Generate an individual treasure haul

### Query string parameters

- `cr` \[required\]: The challenge rating of the encounter; integer greater than or equal to `0`

### Response Attributes

- `cp`: copper pieces
- `sp`: silver pieces
- `ep`: electrum pieces
- `gp`: gold pieces
- `pp`: platinum pieces

### Examples

- challenge rating 1: `GET /treasure/individual?cr=1`
```
{
  "cp": 22,
  "sp": 0,
  "ep": 0,
  "gp": 0,
  "pp": 0
}
```

- challenge rating 20: `GET /treasure/individual?cr=20`
```
{
  "cp": 0,
  "sp": 0,
  "ep": 6000,
  "gp": 2400,
  "pp": 0
}
```