# PathSlicer 
[![Build Status](https://travis-ci.org/mtynior/PathSlicer.svg?branch=master)](https://travis-ci.org/mtynior/PathSlicer) [![Swift 2.2](https://img.shields.io/badge/language-Swift-orange.svg?style=flat)](https://developer.apple.com/swift/) [![License](https://img.shields.io/badge/license-MIT-blue.svg)](https://github.com/mtynior/PathSlicer/blob/master/LICENSE.md) [![CocoaPods](https://img.shields.io/cocoapods/v/PathSlicer.svg)](https://cocoapods.org/pods/PathSlicer) [![Carthage](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/Carthage/Carthage)

Returns information about Nancy style path strings such as `/rebels/{name}/{action}/`.

<br />
<br />
<h1 align="center">Project is no longer maintained!</h1>
<br />
<br />

## Features

- [x] Turns Nancy style path into regular expression
- [x] Returns arguments for capture components
- [x] Allows to add custom path component types
- [ ] Support for case sensitivity
- [ ] Support for optional compoments
- [ ] Support for RegEx named capture groups

## Integration

### Requirements

- iOS 9.0+ / Mac OS X 10.9+ / tvOS 9.0+ / watchOS 2.0+
- Xcode 7.3+

#### CocoaPods
You can use [CocoaPods](http://cocoapods.org/) to install `PathSlicer` by adding it to your `Podfile`:

```ruby
platform :ios, '9.0'
use_frameworks!

target 'MyApp' do
	pod 'PathSlicer'
end
```
Run `pods install` to intagrate pods with your project.

#### Carthage
You can use [Carthage](https://github.com/Carthage/Carthage) to install `PathSlicer ` by adding it to your `Cartfile`:

```
github "mtynior/PathSlicer"
```
Run `carthage update` to build the framework and drag the built `PathSlicer.framework` into your Xcode project.

### Manually
You can also manually add `PathSlicer` to you project:

1. Download repository,
2. Drag `Sources` folder into you project's tree.

## Usage

```swift
let slicer = PathSlicer()

let path = "/rebels/{name}/{action}"
let pathDescription = slicer.getPathDescription(path)
```
The `pathDescription` variable contains following values:

```json
pathDescription = {
	regex = "rebels\\/([^\\\\/]+?)\\/([^\\\\/]+?)(?:\\/(?=$))?$",
	arguments = [ "name", "action" ]
}
```

##Suported segment patterns

### Literal segments
Literal segments don't contain any arguments and are matched as they are.

```swift
let slicer = PathSlicer()

let path = "/empire/darth_vader/choke"
let pathDescription = slicer.getPathDescription(path)
```
The `pathDescription` variable contains following values:

```json
pathDescription = {
	regex = "/empire/darth_vader/choke(?:\\/(?=$))?$",
	arguments = [ ]
}
```

### Capture segments
Capture segments allow to add parameters to the paths. Each capture segment is surrounded by `{` and `}`. Capture segments are returned in `argument` property of path description. 

```swift
let slicer = PathSlicer()

let path = "/empire/{name}/{action}"
let pathDescription = slicer.getPathDescription(path)
```
The `pathDescription` variable contains following values:

```json
pathDescription = {
	regex = "empire\\/([^\\\\/]+?)\\/([^\\\\/]+?)(?:\\/(?=$))?$",
	arguments = [ "name", "action" ]
}
```

### RegEx segments 
RegEx segments allows to define custom component machers. Right now named caupture groups of regular expression are not returned as arguments of path description.

```swift
let slicer = PathSlicer()

let path = "/can_be_jedi/(?<age>[\\d]{1,2})"
let pathDescription = slicer.getPathDescription(path)
```
The `pathDescription` variable contains following values:

```json
pathDescription = {
	regex = "can_be_jedi/(?<age>[\\d]{1,2})(?:\\/(?=$))?$",
	arguments = [ ]
}
```

## License

PathSlicer is released under the MIT license. See LICENSE for details.
