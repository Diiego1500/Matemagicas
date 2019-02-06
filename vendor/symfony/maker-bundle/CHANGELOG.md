1.1
===

* [BC BREAK] The MakerInterface changed: `getParameters()`, `getFiles()`
  and `writeNextStepsMessage()` were removed and `generate()` was added
  in their place. We recommend extending `AbstractMaker` instead of implementing
  the interface directly, and use `$this->writeSuccessMessage()` to get
  the normal "success" message after the command #120 via @weaverryan

* Added new `make:migration` command, which wraps the normal
  `doctrine:migrations:diff` command #97 via @weaverryan

* Added new `make:fixtures` command to generate an empty fixtures class
  #105 via @javiereguiluz

* Added PHPDoc to generated entity repositories so that your IDE knows
  what type of objects are returned #116 @enleur

* Allowed generation of all classes into sub-namespaces #120 via @weaverryan
