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
---

- `GET /gemstones`: Generate a set of gemstones for a treasure hoard

### Notes

- Gems come in denominations of `10 gp`, `50 gp`, `100 gp`, `500 gp`, `1000 gp`, and `5000 gp`
- The actual value of the returned set of gems will be less than the requested value if there is no combination of gems that can achieve the requested value. E.g. a request with `value = 12` will return a single `10 gp` gem.

### Query string parameters

- `value` \[required\]: The maximum total value of the gemstones; integer greater than `0` and less than `10,000,000`
- `single`: if 'true ' the set will only contain a single gemstone; `true` or `false`

### Default Parameters

- `single`: `false`

### Response Attributes

- `total_cost_in_gp`: The total cost of all the gems in the set, in gp
- `gems`: An array of gems
  - `name`: The name of the gem
  - `description`: A description of the gem
  - `cost_in_gp`: The cost of the gem, in gp

### Examples

- max value of 600 gp: `GET /gemstones?value=600`
```
{
  "gems": [
    {
      "name": "Black pearl",
      "description": "opaque pure black",
      "cost_in_gp": 500
    },
    {
      "name": "Spinel",
      "description": "transparent red, red-brown, or deep green",
      "cost_in_gp": 100
    }
  ],
  "total_cost_in_gp": 600
}
```

- single gem with max value 600: `GET /gemstones?value=600&single=true
```
{
  "gems": [
    {
      "name": "Alexandrite",
      "description": "transparent dark green",
      "cost_in_gp": 500
    }
  ],
  "total_cost_in_gp": 500
}
```