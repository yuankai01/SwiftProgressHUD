# SwiftProgressHUD

`SwiftProgressHUD` is an iOS drop-in class that displays a translucent HUD with an indicator and/or labels while work is being done in a background thread. The HUD is meant as a replacement for the undocumented, private `UIKit` `UIProgressHUD` with some additional features.

## Requirements

`SwiftProgressHUD` works on iOS 8+ and requires ARC to build. It depends on the following Apple frameworks, which should already be included with most Xcode templates:

* Swift 3.0+
* Foundation.framework
* UIKit.framework
* CoreGraphics.framework

You will need the latest developer tools in order to build `SwiftProgressHUD`. Old Xcode versions might work, but compatibility will not be explicitly maintained.

## Adding SwiftProgressHUD to your project (添加 SwiftProgressHUD 到你的项目)

### CocoaPods

[CocoaPods](http://cocoapods.org) is the recommended way to add `SwiftProgressHUD` to your project.

1. Add a pod entry for `SwiftProgressHUD` to your Podfile </br>
`pod 'SwiftProgressHUD'`
2. Install the pod(s) by running </br>
`pod install`.
3. Include `SwiftProgressHUD` wherever you need it with </br>
`import SwiftProgressHUD`.

### Carthage

1. Add MBProgressHUD to your Cartfile. e.g., `github "jdg/MBProgressHUD" ~> 1.0.0`
2. Run `carthage update`
3. Follow the rest of the [standard Carthage installation instructions](https://github.com/Carthage/Carthage#adding-frameworks-to-an-application) to add MBProgressHUD to your project.


## 使用举例

在需要等待的时候, 可以使用 showWait, 代码及效果如下:

```swift
/// 设置蒙版背景颜色, 默认是clear
//            SwiftProgressHUD.hudBackgroundColor = UIColor.black.withAlphaComponent(0.2)

/// 开始loading...
SwiftProgressHUD.showWait()

/// 模拟 1s后 加载完成
DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
SwiftProgressHUD.hideAllHUD()
}
```

<img src="https://github.com/YJManager/SwiftProgressHUD/blob/master/SwiftProgressHUDDemo/Resources/AnimationGifs/wait.gif" width="100" height="177" />


加载成功时, 提示可以使用 `showSuccess`, 代码及效果如下:

```swift
SwiftProgressHUD.showSuccess("加载成功")

/// 模拟 1s后 加载完成
DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
SwiftProgressHUD.hideAllHUD()
}
```
<img src="https://github.com/YJManager/SwiftProgressHUD/blob/master/SwiftProgressHUDDemo/Resources/AnimationGifs/success.gif)" width="100" height="177" />

加载失败时, 提示可以使用 `showFail`, 代码及效果如下:

```swift
SwiftProgressHUD.showFail("加载失败")

/// 模拟 1s后 加载完成
DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
SwiftProgressHUD.hideAllHUD()
}
```
<img src="https://github.com/YJManager/SwiftProgressHUD/blob/master/SwiftProgressHUDDemo/Resources/AnimationGifs/fail.gif" width="100" height="177" />

友情提示信息, 可以使用 `showInfo`, 代码及效果如下:

```swift
SwiftProgressHUD.showInfo("请稍后")

/// 模拟 1s后 加载完成
DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
SwiftProgressHUD.hideAllHUD()
}
```
<img src="https://github.com/YJManager/SwiftProgressHUD/blob/master/SwiftProgressHUDDemo/Resources/AnimationGifs/info.gif" width="100" height="177" />

错误Toast提示信息, 可以使用 `showOnlyText`, 代码及效果如下:

```swift
SwiftProgressHUD.showOnlyText("请输入合法的手机号")

/// 模拟 1s后 加载完成
DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
SwiftProgressHUD.hideAllHUD()
}
```
<img src="https://github.com/YJManager/SwiftProgressHUD/blob/master/SwiftProgressHUDDemo/Resources/AnimationGifs/text.gif" width="100" height="177" />

状态栏提示信息, 可以使用 `showOnStatusBar`, 代码及效果如下:

```swift
SwiftProgressHUD.showOnStatusBar("你有一条新消息", autoClear: true, autoClearTime: 1, textColor: UIColor.orange, backgroundColor: UIColor.lightGray)

/// 模拟 1s后 加载完成
DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
SwiftProgressHUD.hideAllHUD()
}

```
<img src="https://github.com/YJManager/SwiftProgressHUD/blob/master/SwiftProgressHUDDemo/Resources/AnimationGifs/status.gif" width="100" height="177" />

加载动画提示, 可以使用 `showAnimationImages`, 代码及效果如下:

```swift
let animationDuration = 70 // 动画时间 单位毫秒Int

var loadingImages = [UIImage]()
for index in 0...16 {
let loadImageName = String(format: "new_brand_progress%02d", index)
if let loadImage = UIImage(named: loadImageName) {
loadingImages.append(loadImage)
}
}

SwiftProgressHUD.showAnimationImages(loadingImages, timeMilliseconds: animationDuration, backgroundColor: backgroundColor, scale: scale)

/// 模拟 1s后 加载完成
DispatchQueue.main.asyncAfter(deadline: .now() + 4) {
SwiftProgressHUD.hideAllHUD()
}
```
<img src="https://github.com/YJManager/SwiftProgressHUD/blob/master/SwiftProgressHUDDemo/Resources/AnimationGifs/clearAnimation.gif" width="100" height="177" />
<img src="https://github.com/YJManager/SwiftProgressHUD/blob/master/SwiftProgressHUDDemo/Resources/AnimationGifs/bgAnimation.gif" width="100" height="177" />

## License

This code is distributed under the terms and conditions of the [MIT license](LICENSE).

## Change-log

A brief summary of each MBProgressHUD release can be found in the [CHANGELOG](CHANGELOG.mdown). 

