function Get-Magic8Ball {
<#
.SYNOPSIS
    Get one of the answers from the magic 8 ball.
.DESCRIPTION
    Get one of the answers from the magic 8 ball. The 20 possible answers are:

    As I see it, yes.
    Ask again later.
    Better not tell you now.
    Cannot predict now.
    Concentrate and ask again.
    Don't count on it.
    It is certain.
    It is decidedly so.
    Most likely.
    My reply is no.
    My sources say no.
    Outlook not so good.
    Outlook good.
    Reply hazy, try again.
    Signs point to yes.
    Very doubtful.
    Without a doubt.
    Yes.
    Yes - definitely.
    You may rely on it.
.EXAMPLE
    Get-Magic8Ball

    Reply hazy, try again.
#>

    $Answer = @(
        'As I see it, yes.',
        'Ask again later.',
        'Better not tell you now.',
        'Cannot predict now.',
        'Concentrate and ask again.',
        "Don't count on it.",
        'It is certain.',
        'It is decidedly so.',
        'Most likely.',
        'My reply is no.',
        'My sources say no.',
        'Outlook not so good.',
        'Outlook good.',
        'Reply hazy, try again.',
        'Signs point to yes.',
        'Very doubtful.',
        'Without a doubt.',
        'Yes.',
        'Yes - definitely.',
        'You may rely on it.'
    )

    $Answer | Get-Random

}
