import UIKit

public extension UIViewController {
    
    var isVisible: Bool {
        // http://stackoverflow.com/questions/2777438/how-to-tell-if-uiviewcontrollers-view-is-visible
        return self.isViewLoaded && view.window != nil
    }
}

public extension UIViewController {
    
    var navigationBarColor: UIColor? {
        get {
            if let me = self as? UINavigationController, let visibleViewController = me.visibleViewController {
                return visibleViewController.navigationBarColor
            }
            return navigationController?.navigationBar.tintColor
        } set(value) {
            navigationController?.navigationBar.barTintColor = value
        }
    }
}

public extension UIViewController {
    
    func topMostViewController() -> UIViewController {
        if let tab = self as? UITabBarController {
            return tab.topMostViewController()
        }
        if let navigation = self as? UINavigationController {
            return navigation.topMostViewController()
        }
        if let presented = self.presentedViewController {
            return presented.topMostViewController()
        }
        
        return self
    }
    
    func isModal() -> Bool {
        return self.presentingViewController?.presentedViewController == self
            || (self.navigationController != nil && self.navigationController?.presentingViewController?.presentedViewController == self.navigationController)
            || self.tabBarController?.presentingViewController is UITabBarController
    }
    
    func popViewController() {
        _ = navigationController?.popViewController(animated: true)
    }
    
    func pushViewController(_ viewController: UIViewController) {
        navigationController?.pushViewController(viewController, animated: true)
    }
    
    // Dismiss UIViewController while draging or screen edge gesture
    func dragToDismiss () {
        let popGestureRecognizer = self.navigationController!.interactivePopGestureRecognizer!
        if let targets = popGestureRecognizer.value(forKey: "targets") as? NSMutableArray {
            let gestureRecognizer = UIPanGestureRecognizer()
            gestureRecognizer.setValue(targets, forKey: "targets")
            self.view.addGestureRecognizer(gestureRecognizer)
        }
    }
    
}
