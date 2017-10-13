# Elm searchable dropdown workshop project

This is a project used as an intro to [Elm](http://elm-lang.org/) workshop. It
builds a filterable dropdown similar to [Select2](https://select2.org/). It
takes a lot of small steps and doesn't make assumptions of existing Elm
knowledge.

I wrote the dropdown in ~30 minutes with the expectation that a workshop could
go through it in 90-120 minutes.

Each commit is a step with a detailed commit message explaining what was done
and why. For ease of trying things out, I've linked the full source for each
commit as an [Ellie](https://ellie-app.com/) along with the accompanying commit
message on this README. Unfortunately, GitHub doesn't allow iframe embedding in
markdown docs.

## 1 - Initialize Project

* [Commit](https://github.com/JoelQ/example-elm-searchable-dropdown/commit/53138a4eec39e86d5bc194cddd162f3aa564251f)

## 2 - Start with "hello world"

> Just display some static text on the page. Boring

* [Commit](https://github.com/JoelQ/example-elm-searchable-dropdown/commit/0409757a282b89ea1f086587296a18fba8d94b06)
* [Ellie](https://ellie-app.com/s8mfMfS86a1/0)

## 3 - Display a static list of fruit

> Display an unordered HTML list with each element in the list `fruit`.
>
> The helper functions from `Html` take two arguments: a list of
attributes and a list of children. Since `List.map` returns a list, we don't
need to wrap it in brackets.

* [Commit](https://github.com/JoelQ/example-elm-searchable-dropdown/commit/460e3487f1d4db78244cc7897a5bf22fd11a02d7)
* [Ellie](https://ellie-app.com/scM6f6Px7a1/0)

## 4 - Extract view function

> Remove the logic from `main` and into a `view` function that handles
turning a list of values into an Html list.

* [Commit](https://github.com/JoelQ/example-elm-searchable-dropdown/commit/17b1dc8b76be57fe51278d7a9ce75ec9245cf54b)
* [Ellie](https://ellie-app.com/sf3KnFm4Na1/0)

## 5 - Add concept of open/closed

> Create a model that contains both the list of values and the idea of
being open or closed. The view is rendered differently depending on
whether it is open or closed.
>
> The closed view is static so it doesn't require any arguments.

* [Commit](https://github.com/JoelQ/example-elm-searchable-dropdown/commit/7283ca3167a61932b54e40dae71679fcf8578351)
* [Ellie](https://ellie-app.com/sgMNCtRZMa1/0)

**Note:** _There is a bug in the commit where we're passing an argument to the
function `viewClosed` when it takes no arguments. This is fixed in the Ellie
embed. It also gets fixed in the source in a later commit._

## 6 - Add `Model` type alias

> Using the record type is awkward so alias it as `Model` so we can use it
in signatures easily.
>
> Note that this is different than the `State` type which is _not_ an
alias but instead is its own thing.

* [Commit](https://github.com/JoelQ/example-elm-searchable-dropdown/commit/499e87be3861f0efdb05b1714c85874c3d429e41)
* [Ellie](https://ellie-app.com/sj3xF7W8da1/0)

## 7 - Introduce the Elm architecture

> The `main` function is no longer static but instead uses `Html.program`.
The `Html.program` function takes in record with three vallues: an
initial model, a `view` function, and an `update` function. Note that
functions can be passed as arguments to other functions.
>
> The `update` function takes in an event and the current model and returns
a new model. In this simplest implementation, we're ignoring the event
and always returning the current model. Because the view only changes if
the model changes, we still effectively have a static app.

* [Commit](https://github.com/JoelQ/example-elm-searchable-dropdown/commit/4951c7a6ccdbd679c2a47abdb5739738ae9c69de)
* [Ellie](https://ellie-app.com/smcXDQ4kBa1/0)

## 8 - React to open and close events

> We add a `Msg` type that defines two events `OpenSelect` and
`CloseSelect`. The `update` handles both of these by correctly changing
the model. The view gets re-rendered whenever the model changes.
>
> We emit the events from the views in response to a click event handler.
>
> Note that the type signatures for the view functions changed from `Html
a` to `Html Maybe`. That's because the views are now emitting `Msg`
events.

* [Commit](https://github.com/JoelQ/example-elm-searchable-dropdown/commit/ece755b627b4d64a517ddd14e496923e634a7d8c)
* [Ellie](https://ellie-app.com/snhnt6FRda1/0)

## 9 - Add the concept of a "selected" value

> The whole point of this is to be able to select values. Since it's
possible for no values to be selected, we wrap it in `Maybe`.
>
> The view gets trickier because there are now 4 ways to render the
dropdown:
>
> Open vs Closed each with the appropriate click handler and displaying
the selected text or the help tip if nothing is selected.
>
> To accomplish this, we extract a `dropdownHead` function that deals with
selected vs no selection. Since we already know whether the dropdown is
open or not, we just pass in the `Msg` type we want for the click
handler.
>
> Because we're now handling whether an item is selected or not, the
closed view is no longer static.

* [Commit](https://github.com/JoelQ/example-elm-searchable-dropdown/commit/99d4d2cba340b6b3dd2e6a382d8836ac5ed7982a)
* [Ellie](https://ellie-app.com/spBqR3rnga1/0)

## 10 - Set selected item when clicked

> This sets our selected item in response to a Msg sent when the user
clicks on an item. This Msg is more complex than previous ones because
it wraps a value.
>
> This means we need to give it a value in the click handler. When
reacting to the event, we unwrap the value as part of the case
statement, just like we did for the `Maybe`.

* [Commit](https://github.com/JoelQ/example-elm-searchable-dropdown/commit/f19dc86c761c339855438c40dafeed6d45d1683a)
* [Ellie](https://ellie-app.com/sqVcGrKwta1/0)

## 11 - Close the dropdown when item is selected

> We already have an event that handles an item selection, now we just
need to change the model's state to "closed".

* [Commit](https://github.com/JoelQ/example-elm-searchable-dropdown/commit/2eff6798006c96ef704f66adb9feccf5b32ad8d1)
* [Ellie](https://ellie-app.com/srRGk3jJHa1/0)

## 12 - Filter values based on query

> Only display values in the dropdown that match the given query (case
insensitive). Since all the original values are kept, we can re-filter
them by a different query at any time.

* [Commit](https://github.com/JoelQ/example-elm-searchable-dropdown/commit/0355ee6e15af4f4bde566207dedf9a12a27f7b35)
* [Ellie](https://ellie-app.com/stPBCckbca1/0)

## 13 - Set search query as user types

> When the user types in the text box, we set the query value on the
model, thus filtering the dropdown.
>
> Note that the new Msg value `SearchInput` takes a paremeter, we don't
give it one in `onInput`. While `onClick` takes a Msg as its argument,
`onInput` takes a _function_ `String -> Msg` as its argument.
>
> `SearchInput` is such a function when not given a value.
>
> `onInput` does this because we don't know the value ahead of time.
Instead, it will put the whatever value the user has typed inside the
Msg.

* [Commit](https://github.com/JoelQ/example-elm-searchable-dropdown/commit/cd42ae00592ff08c2a4f3deafe70ecbeb5d1e71c)
* [Ellie](https://ellie-app.com/swRbgrn3Ma1/0)

## 14 - Clear the filter when item is selected

> We introduced a bug in the previous commit occurred when:
>
> 1. The results were filtered
> 2. A value was selected (which auto-closes the dropdown)
> 3. The user re-opens the dropdown
> 4. The results are still filtered from last time
> 
> We fix this by setting the query to empty string whenever a selection is
made, thus clearing the filter for next time.

* [Commit](https://github.com/JoelQ/example-elm-searchable-dropdown/commit/a4c86fa66c8795c584dfc86b2720b2ddd093da81)
* [Ellie](https://ellie-app.com/sz2NR82Rwa1/0)

## 15 - Introduce `Html.program`

>This is a more complex program that allows interaction with the outside
world with commands and subscriptions. Following the compiler errors,
we update signatures and return values to match what is required from
`Html.program`.

* [Commit](https://github.com/JoelQ/example-elm-searchable-dropdown/commit/c0e9979f133f78b72cee4f2bdd0d63904e18e475)
* [Ellie](https://ellie-app.com/sBC26vxVca1/0)

## 16 - Focus search input when opening dropdown

> This uses a combination of `Dom.focus` and `Task.attempt` to create a
Cmd that will focus the DOM node with the given id. Since all Cmds
trigger a Msg when they are done but we just want to fire and forget, we
create a Noop Msg to deal with the situation.

* [Commit](https://github.com/JoelQ/example-elm-searchable-dropdown/commit/24d2f31a7e8e14daa9933e5af13de771216e0ba0)
* [Ellie](https://ellie-app.com/sDdTg7dJKa1/0)

## 17 - Add styles with an index.html

> We want to style the dropdown so we embed the Elm app on an HTML page
that has a `<style>` element on the body. This means we can no longer
just use `elm reactor`. We must now compile the app using `elm-make`

* [Commit](https://github.com/JoelQ/example-elm-searchable-dropdown/commit/bf46698113cab50c2511e6c37000b3889297bb34)
* [Ellie](https://ellie-app.com/sGbMLY7kma1/0)

## License

This project is distributed under the [BSD 3-clause license](LICENSE.md)

## About thoughtbot

![thoughtbot](http://presskit.thoughtbot.com/images/thoughtbot-logo-for-readmes.svg)

This example project and walkthrough was developed for a workshop given at
[thoughtbot](https://thoughtbot.com?utm_source=github).

We love open source software!
See [our other projects][community] or
[hire us][hire] to design, develop, and grow your product.

[community]: https://thoughtbot.com/community?utm_source=github
[hire]: https://thoughtbot.com?utm_source=github
