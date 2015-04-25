# markthru
convert markdown files into step-by-step walkthroughs - in your browser!

## use

make markdown files of the form

```
# heading 1

whatever

## heading 2

![pictures!](http://cool.biz/cat.gif)
```

and put that HTML in the #content div of `app/index.html` 

now `coffee server.coffee` and visit that webpage to see your compiled clickthru tutorial!

## potential improvements

```
options = 
    show_previous_questions: false
    next_button_text: Next
    prev_button_text: Previous
```

## installation 

make sure you have `node`, `npm` and `grunt`

then just
```npm install```

`grunt` compiles `app/` to a neat bundle in `built-app/` coffeeify (browserify for coffeescript)

