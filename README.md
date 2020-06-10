# MyFunctions

A variety of Powershell functions and filters wrapped into a module.

## Install the module

Copy the `MyFunctions` folder into one of the folders specified in the `$env:PSMODULEPATH` folders.

To display the paths enter the following command.

    $env:PSMODULEPATH

To display in a way better understood by you the human:

    $env:PSMODULEPATH -Split ';'

Or you can save it to a variable

    $ModPath = $env:PSMODULEPATH -Split ';'

Then you can reference a particular path

    $ModPath[1]


## Import the module

To import the module enter the following command

    Import-Module -Name MyFunctions

## Scripts

For the scripts themselves see [**Scripts**](Scripts) folder.

- CopyNul.cmd
- LongNamePath.cmd
- PsLaunch.cmd
- ShortNamePath.cmd
- Test-IsAdmin.cmd

## EOF - End Of File Comment
