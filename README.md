```md

## Blockquote

> This is a blockquote
> with several lines

## Tables

Tables aren't part of the core Markdown spec, but Zola supports supports them out-of-the-box.

   Name | Age
--------|------
    Bob | 27
  Alice | 23

## Inline Markdown within tables

| Inline&nbsp;&nbsp;&nbsp;     | Markdown&nbsp;&nbsp;&nbsp;  | In&nbsp;&nbsp;&nbsp;                | Table      |
| ---------- | --------- | ----------------- | ---------- |
| *italics*  | **bold**  | ~~strikethrough~~&nbsp;&nbsp;&nbsp; | `code`     |

## Code Blocks

#### Code block with backticks

```python
prices = {'apple': 0.40, 'banana': 0.50}
my_purchase = {
  'apple': 1,
  'banana': 6
}
grocery_bill = sum(prices[fruit] * my_purchase[fruit]
                   for fruit in my_purchase)
print('I owe the grocer $%.2f' % grocery_bill)
```

## List Types

#### Ordered List

1. First item
2. Second item
3. Third item

#### Unordered List

* List item
* Another item
* And another item

#### Nested list

* Item
    1. First Sub-item
    2. Second Sub-item

## Other Elements — abbr, sub, sup, kbd, mark

<abbr title="Graphics Interchange Format">GIF</abbr> is a bitmap image format.

H<sub>2</sub>O

X<sup>n</sup> + Y<sup>n</sup> = Z<sup>n</sup>

Press <kbd><kbd>CTRL</kbd>+<kbd>ALT</kbd>+<kbd>Delete</kbd></kbd> to end the session.

<mark>Skinks</mark> can often hide easily in their habitat because of their protective colouring (camouflage).


{{ img(path="./image.jpg", alt="") }}

```
