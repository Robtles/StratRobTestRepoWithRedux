//
//  ControllersUtilityBase.swift
//  StratRobTestRepoWithRedux
//
//  Created by Rob on 06/03/2019.
//  Copyright © 2019 com.rob. All rights reserved.
//

class ControllersUtilityBase: ShapeControllersFeature {
    
    // MARK: Instance Properties
    
    var isDismissingByBottom: Bool = false
    
    // MARK: View Properties
    
    @IBOutlet weak var alertView: UIView?
    
    @IBOutlet weak var overlayView: UIView?
    
}

// MARK: - UIViewControllerTransitioningDelegate

extension ControllersUtilityBase: UIViewControllerTransitioningDelegate {
    
    public func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return PresentOverlayedModalViewAnimationController()
    }
    
    public func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return DismissOverlayedModalViewAnimationController()
    }
    
}

// MARK: - UIViewControllerAnimatedTransitioning

private final class PresentOverlayedModalViewAnimationController: NSObject, UIViewControllerAnimatedTransitioning {
    
    public func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.3
    }
    
    public func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        let toViewController: ControllersUtilityBase = transitionContext.viewController(forKey: UITransitionContextViewControllerKey.to) as! ControllersUtilityBase
        let duration = self.transitionDuration(using: transitionContext)
        let containerView = transitionContext.containerView
        toViewController.view.frame = containerView.frame
        containerView.addSubview(toViewController.view)
        toViewController.overlayView?.alpha = 0.0
        UIView.animate(withDuration: duration, animations: {
            toViewController.overlayView?.alpha = 0.6
        })
        let finishFrame = toViewController.alertView?.frame
        var startingFrame = finishFrame
        startingFrame?.origin.y = -((finishFrame?.height)!)
        toViewController.alertView?.frame = startingFrame!
        UIView.animate(withDuration: 0.5, delay: 0.0, usingSpringWithDamping: 0.7, initialSpringVelocity: 1.0, options: .layoutSubviews, animations: {
            toViewController.alertView?.frame = finishFrame!
        }, completion: { result in
            transitionContext.completeTransition(result)
        })
    }
    
}

private final class DismissOverlayedModalViewAnimationController: NSObject, UIViewControllerAnimatedTransitioning {
    
    public func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.3
    }
    
    public func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        let fromViewController: ControllersUtilityBase = transitionContext.viewController(forKey: UITransitionContextViewControllerKey.from) as! ControllersUtilityBase
        let duration = self.transitionDuration(using: transitionContext)
        UIView.animate(withDuration: duration, animations: {
            fromViewController.overlayView?.alpha = 0.0
        })
        UIView.animate(withDuration: duration, delay: 0.0, usingSpringWithDamping: 1.0, initialSpringVelocity: 1.0, options: .layoutSubviews, animations: {
            fromViewController.alertView?.frame.origin.y = fromViewController.isDismissingByBottom ? fromViewController.view.frame.size.height : -(fromViewController.alertView?.frame.height)!
        }, completion: { result in
            transitionContext.completeTransition(true)
        })
    }
    
}
