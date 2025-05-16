# UIKeyCommandTableView

A custom `UITableView` subclass that enables keyboard-based navigation and selection.

## Overview

UIKeyCommandTableView allows you to use hardware keyboard shortcuts to navigate and interact with table views. It supports customizable key commands and delegate callbacks for handling selection and activation events.

## Features

- Keyboard navigation with arrow keys.
- Selection and activation using space bar or return key.
- Customizable key command options.
- Delegate support for responding to key command events.
- Built-in tests ensuring reliability.

## Installation

UIKeyCommandTableView is available via Swift Package Manager. Add the following dependency to your Package.swift:

```swift
dependencies: [
    .package(url: "https://github.com/ipedro/UIKeyCommandTableView.git", from: "1.0.0")
]
```

Then, add `"UIKeyCommandTableView"` as a dependency for your target.

## Usage

Import the package into your view controller:

```swift
import UIKeyCommandTableView
```

Use UIKeyCommandTableView as you would any UITableView and implement the `UITableViewKeyCommandsDelegate` to respond to first responder events and key command actions.

### Basic Initialization

Instantiate and add a UIKeyCommandTableView to your view controller:

```swift
class MyViewController: UIViewController, UITableViewKeyCommandsDelegate {
    let tableView = UIKeyCommandTableView()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Setup table view frame, dataSource, delegate, etc.
        tableView.frame = view.bounds
        tableView.keyCommandsDelegate = self
        view.addSubview(tableView)
    }

    // UITableViewKeyCommandsDelegate methods
    func tableViewDidBecomeFirstResponder(_ tableView: UIKeyCommandTableView) { 
        // handle event
    }
    
    func tableViewDidResignFirstResponder(_ tableView: UIKeyCommandTableView) { 
        // handle event
    }
    
    func tableViewKeyCommandSelectionBelowBounds(_ tableView: UIKeyCommandTableView) -> UIKeyCommandTableView.OutOfBoundsBehavior {
       return .wrapAround
    }
    
    func tableViewKeyCommandSelectionAboveBounds(_ tableView: UIKeyCommandTableView) -> UIKeyCommandTableView.OutOfBoundsBehavior {
       return .wrapAround
    }
}
```

### Customizing Key Commands

Customize key command options to fit your needs:

```swift
// In your view controller or table view setup:
tableView.selectPreviousKeyCommandOptions = [.arrowUp, .command(.arrowUp)]
tableView.selectNextKeyCommandOptions = [.arrowDown, .command(.arrowDown)]
tableView.activateSelectionKeyCommandOptions = [.spaceBar, .return]
```

## Requirements

- iOS 11 or later

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.
