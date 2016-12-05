Welcome to an example game! When you write simple text like this it will be shown to the player.

# This is a comment!
#{
    this is a multi-line comment
}


# Variables look like this:
$variable = true
$ another_variable=hello

$name = <<
Hello $name!


# Possible version of an if statement
? ($var == "some text here") ->location | ->somewhere


# You can use randomisation in your stories!
% one, of, these, words, will, be, picked
%{ in-line, version, looks, like, this }
% {
    can also be
    on multiple lines
    each line will
    count as one item
}

# You can also weight the randomisation:
# hello has an 66% chance of being chosen, goodbye has 33% chance
% 2: The person ran away. 1: You caught them.

# There is also a multi-line/in-line version!
% {
    3: More likely (75%)
    1: Less likely (25%)
}

# This will be printed with hello or goodbye in the middle
Some text %{ hello, goodbye } that continues here.

# You can jump to other places in the story with this:
@warp
Here is some stuff!
->warp

# Variables look like this!
$name = Ben
Hello $name, how are you?

& print("This is lua code!")
& {
    function stuff()
        some_text = "You can use the bounded version too."
        print(some_text)
    end
}

&stuff(inventory)


# That variable also exists in the rest of the file:
$some_text
