
Function Count-words{
    <#
        .Synopsis
            Displays the amount of words in a sentence.

        .Description
             Displays the amount of words in a sentence.

        .Parameter sentence
            a sentence.

        .Example
            # Count the amount of words 
            Count-words "This is a lovely sentence"
    #>
    [CmdletBinding()]
    param ([string] $string)
    return $string.split(' ').Count

}
