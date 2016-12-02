# StringInflections

## Case

"just in CASE":
* `string.camelcased()`: `"justInCase"`
* `string.camelcased(uppercaseFirst: true)`: `"JustInCase"`
* `string.underscored()`: `"just_in_case"`

## Plural and singular

This does very simple, non-localized inflection.

* `string.pluralized()`
* `string.singularized()`

You can add your own regex-based rules:

```swift
Inflector.pluralizer.inflect("octopus$", as: "octopodes")
"octopus".pluralized() // "octopodes"

Inflector.singularizer.inflect("people$", as: "soylent")
"people".singularized() // "soylent"

```
