# TwitterAlert

[![Carthage compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/tomoki69386/TwitterAlert)

<img width="559" alt="2018-11-24 11 46 01" src="https://user-images.githubusercontent.com/28350464/48963873-0b886100-efe0-11e8-9eb5-a30b783f7410.png">

# Installation

TwitterAlert is available through Carthage.



### Carthage 

Write this code in your Cartfile.

```
github "tomoki69386/TwitterAlert"
```



and implement this command

```
carthage update
```

Add TwitterAlert.framework in /Carthage/Build/iOS/ to Embedded Binaries.



# Usage

Create TwitterAlertView in swift file



```swift
import TwitterAlert

let customView = TwitterAlert()
customView.load(item: ["コメント", "リツイート"])
customView.frame = self.view.bounds
customView.delegate = self
self.view.addSubview(customView)
```



Conform to TwitterAlertDelegate

```swift
class ViewController: UIViewController, TwitterAlertDelegate {
```

### TwitterAlertDelegate method
When did tap, this method is called

```swift
func twitterAlert(_ twitterAlert: TwitterAlert, didSelectRowAt indexPath: IndexPath)
```



# Demo

Check the Demo file!!

```swift
import UIKit
import TwitterAalert

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func tap() {
        let customView = TwitterAlert()
        customView.load(item: ["コメント", "リツイート"])
        customView.frame = self.view.bounds
        customView.delegate = self
        self.view.addSubview(customView)
    }


}

extension ViewController: TwitterAlertDelegate {
    func twitterAlert(_ twitterAlert: TwitterAlert, didSelectRowAt indexPath: IndexPath) {
        print(indexPath.row)
    }
}
```



# Contribution
Please create issues or submit pull requests for anything.

# License

TwitterAlert is released under the MIT license.

© 2018 GitHub, Inc.
