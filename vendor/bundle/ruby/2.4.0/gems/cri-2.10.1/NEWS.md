Cri News
========

## 2.10.1

Fixes:

* Restored Ruby 2.1 compatibility (for now)

## 2.10.0

Features:

* Added support for skipping option parsing (#62) [Tim Sharpe]

This release drops support for Ruby 2.1, which is no longer supported.

## 2.9.1

Fixes:

* Made default values be always returned, even when not explicitly specified (#57, #58)

## 2.9.0

Features:

* Allowed specifying default option value (#55)

Enhancements:

* Added support for specifying values for combined options (#56)

## 2.8.0

Features:

* Allowed passing `hard_exit: false` to `Command#run` to prevent `SystemExit` (#51)
* Allowed specifying the default subcommand (#54)

## 2.7.1

Fixes:

* Fixed some grammatical mistakes

## 2.7.0

Features:

* Added support for hidden options (#43, #44) [Bart Mesuere]

Enhancements:

* Added option values to help output (#37, #40, #41)
* Made option descriptions wrap (#36, #45) [Bart Mesuere]

## 2.6.1

* Disable ANSI color codes when not supported (#31, #32)

## 2.6.0

* Added support for multi-valued options (#29) [Toon Willems]

## 2.5.0

* Made the default help command handle subcommands (#27)
* Added `#raw` method to argument arrays, returning all arguments including `--` (#22)

## 2.4.1

* Fixed ordering of option groups on Ruby 1.8.x (#14, #15)
* Fixed ordering of commands when --verbose is passed (#16, #18)

## 2.4.0

* Allowed either short or long option to be, eh, optional (#9, #10) [Ken Coar]
* Fixed wrap-and-indent behavior (#12) [Ken Coar]
* Moved version information into `cri/version`

## 2.3.0

* Added colors (#1)
* Added support for marking commands as hidden

## 2.2.1

* Made command help sort subcommands

## 2.2.0

* Allowed commands with subcommands to have a run block

## 2.1.0

* Added support for runners
* Split up local/global command options

## 2.0.2

* Added command filename to stack traces

## 2.0.1

* Sorted ambiguous command names
* Restored compatibility with Ruby 1.8.x

## 2.0.0

* Added DSL
* Added support for nested commands

## 1.0.1

* Made gem actually include code. D'oh.

## 1.0.0

* Initial release!
