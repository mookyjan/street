//
//  UiViewExtension.swift
//  Yogurt
//
//  Created by Vivek Parihar on 13/11/2015.
//  Copyright © 2015 Yogurt Lbas. All rights reserved.
//

import UIKit

// MARK: - Other
extension UIView {
    func applyAllSubviews(@noescape f: (view: UIView) -> ()) {
        for view in subviews {
            f(view: view)
            view.applyAllSubviews(f)
        }
    }
    
    func applyAllViews(@noescape f: (view: UIView) -> ()) {
        f(view: self)
        applyAllSubviews(f)
    }
    
    //ANIMATION
    func fadeOut(vc:UIViewController,delay:NSTimeInterval,duration:NSTimeInterval){
        UIView.beginAnimations(nil, context: nil)
        UIView.setAnimationDuration(duration)
        UIView.setAnimationDelay(delay)
        UIView.setAnimationDelegate(vc)
        self.alpha = 0
        UIView.commitAnimations()
    }
    
    func fadeOut(vc:UIViewController,delay:NSTimeInterval,duration:NSTimeInterval,completionHandler:(()->Void)?){
        UIView.beginAnimations(nil, context: nil)
        UIView.setAnimationDuration(duration)
        UIView.setAnimationDelay(delay)
        UIView.setAnimationDelegate(vc)
        self.alpha = 0
        UIView.commitAnimations()
    }
    
    func fadeIn(vc:UIViewController,delay:NSTimeInterval,duration:NSTimeInterval){
        UIView.beginAnimations(nil, context: nil)
        UIView.setAnimationDuration(duration)
        UIView.setAnimationDelay(delay)
        UIView.setAnimationDelegate(vc)
        self.alpha = 1
        UIView.commitAnimations()
    }
    
    func moveView(duration:NSTimeInterval,x:CGFloat,y:CGFloat){
        UIView.beginAnimations(nil, context: nil)
        UIView.setAnimationDuration(duration)
        UIView.setAnimationCurve(UIViewAnimationCurve.EaseOut)
        UIView.setAnimationBeginsFromCurrentState(true)
        let transform = CGAffineTransformMakeTranslation(x, y)
        self.transform = transform
        self.transform = transform
        self.transform = transform
        UIView.commitAnimations()
    }
    
    //UI
    func addGradientSublayer(topColor topColor:UIColor,bottomColor:UIColor,width:CGFloat,height:CGFloat){
        let gl = CAGradientLayer()
        gl.colors = [topColor.CGColor, bottomColor.CGColor] as [AnyObject]
        gl.frame = CGRectMake(0, 0, width, height)
        self.layer.insertSublayer(gl, atIndex: 0)
    }
    
    func roundLeftCorners(frame:CGRect,radius:CGSize){
        let headerMaskPath = UIBezierPath(roundedRect: frame, byRoundingCorners: [.TopLeft, .BottomLeft],
            cornerRadii: radius)
        let headerMaskLayer = CAShapeLayer()
        headerMaskLayer.path = headerMaskPath.CGPath
        self.layer.mask = headerMaskLayer
    }
    
    func roundRightCorners(frame:CGRect,radius:CGSize){
        let headerMaskPath = UIBezierPath(roundedRect: frame, byRoundingCorners: [.TopRight, .BottomRight],
            cornerRadii: radius)
        let headerMaskLayer = CAShapeLayer()
        headerMaskLayer.path = headerMaskPath.CGPath
        self.layer.mask = headerMaskLayer
    }
    
    func roundAllCorners(frame:CGRect,radius:CGSize){
        let headerMaskPath = UIBezierPath(roundedRect: frame, byRoundingCorners: [.TopLeft, .BottomLeft, .TopRight, .BottomRight],
            cornerRadii: radius)
        let headerMaskLayer = CAShapeLayer()
        headerMaskLayer.path = headerMaskPath.CGPath
        self.layer.mask = headerMaskLayer
    }
    
    func roundBotomLeftCorner(frame:CGRect,radius:CGSize){
        let headerMaskPath = UIBezierPath(roundedRect: frame, byRoundingCorners: .BottomLeft, cornerRadii: radius)
        let headerMaskLayer = CAShapeLayer()
        headerMaskLayer.path = headerMaskPath.CGPath
        self.layer.mask = headerMaskLayer
    }
    
    func roundBotomRightCorner(frame:CGRect,radius:CGSize){
        let headerMaskPath = UIBezierPath(roundedRect: frame, byRoundingCorners: .BottomRight, cornerRadii: radius)
        let headerMaskLayer = CAShapeLayer()
        headerMaskLayer.path = headerMaskPath.CGPath
        self.layer.mask = headerMaskLayer
    }
    
    func roundTopCorners(frame:CGRect,radius:CGSize){
        let headerMaskPath = UIBezierPath(roundedRect: frame, byRoundingCorners: [.TopLeft, .TopRight], cornerRadii: radius)
        let headerMaskLayer = CAShapeLayer()
        headerMaskLayer.path = headerMaskPath.CGPath
        self.layer.mask = headerMaskLayer
    }
    
    func roundSpecifiedCorners(frame:CGRect,radius:CGSize, corners:UIRectCorner){
        let headerMaskPath = UIBezierPath(roundedRect: frame, byRoundingCorners: corners, cornerRadii: radius)
        let headerMaskLayer = CAShapeLayer()
        headerMaskLayer.path = headerMaskPath.CGPath
        self.layer.mask = headerMaskLayer
    }

}

// MARK: - Animations
/**
 A preset animation behavior.
 */
enum AnimationType {
    case SlideLeft, SlideRight, SlideDown, SlideUp, SqueezeLeft, SqueezeRight, SqueezeDown, SqueezeUp, FadeIn, FadeOut, FadeOutIn, FadeInLeft, FadeInRight, FadeInDown, FadeInUp, ZoomIn, ZoomOut, Fall, Shake, Pop, FlipX, FlipY, Morph, Squeeze, Flash, Wobble, Swing
    static let allValues = [Shake, Pop, Morph, Squeeze, Wobble, Swing, FlipX, FlipY, Fall, SqueezeLeft, SqueezeRight, SqueezeDown, SqueezeUp, SlideLeft, SlideRight, SlideDown, SlideUp,  FadeIn, FadeOut, FadeOutIn, FadeInLeft, FadeInRight, FadeInDown, FadeInUp, ZoomIn, ZoomOut, Flash]
}

/**
 Easing curve to be used in animation.
 */
enum AnimationEasingCurve {
    case EaseIn, EaseOut, EaseInOut, Linear, EaseInSine, EaseOutSine, EaseInOutSine, EaseInQuad, EaseOutQuad, EaseInOutQuad, EaseInCubic, EaseOutCubic, EaseInOutCubic, EaseInQuart, EaseOutQuart, EaseInOutQuart, EaseInQuint, EaseOutQuint, EaseInOutQuint, EaseInExpo, EaseOutExpo, EaseInOutExpo, EaseInCirc, EaseOutCirc, EaseInOutCirc, EaseInBack, EaseOutBack, EaseInOutBack, Spring
    static let allValues = [EaseIn, EaseOut, EaseInOut, Linear, EaseInSine, EaseOutSine, EaseInOutSine, EaseInQuad, EaseOutQuad, EaseInOutQuad, EaseInCubic, EaseOutCubic, EaseInOutCubic, EaseInQuart, EaseOutQuart, EaseInOutQuart, EaseInQuint, EaseOutQuint, EaseInOutQuint, EaseInExpo, EaseOutExpo, EaseInOutExpo, EaseInCirc, EaseOutCirc, EaseInOutCirc, EaseInBack, EaseOutBack, EaseInOutBack, Spring]
    var timingFunction:CAMediaTimingFunction {
        switch self {
        case .EaseIn: return CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseIn)
        case .EaseOut: return CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseOut)
        case .EaseInOut: return CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
        case .Linear: return CAMediaTimingFunction(name: kCAMediaTimingFunctionLinear)
        case .EaseInSine: return CAMediaTimingFunction(controlPoints: 0.47, 0, 0.745, 0.715)
        case .EaseOutSine: return CAMediaTimingFunction(controlPoints: 0.39, 0.575, 0.565, 1)
        case .EaseInOutSine: return CAMediaTimingFunction(controlPoints: 0.445, 0.05, 0.55, 0.95)
        case .EaseInQuad: return CAMediaTimingFunction(controlPoints: 0.55, 0.085, 0.68, 0.53)
        case .EaseOutQuad: return CAMediaTimingFunction(controlPoints: 0.25, 0.46, 0.45, 0.94)
        case .EaseInOutQuad: return CAMediaTimingFunction(controlPoints: 0.455, 0.03, 0.515, 0.955)
        case .EaseInCubic: return CAMediaTimingFunction(controlPoints: 0.55, 0.055, 0.675, 0.19)
        case .EaseOutCubic: return CAMediaTimingFunction(controlPoints: 0.215, 0.61, 0.355, 1)
        case .EaseInOutCubic: return CAMediaTimingFunction(controlPoints: 0.645, 0.045, 0.355, 1)
        case .EaseInQuart: return CAMediaTimingFunction(controlPoints: 0.895, 0.03, 0.685, 0.22)
        case .EaseOutQuart: return CAMediaTimingFunction(controlPoints: 0.165, 0.84, 0.44, 1)
        case .EaseInOutQuart: return CAMediaTimingFunction(controlPoints: 0.77, 0, 0.175, 1)
        case .EaseInQuint: return CAMediaTimingFunction(controlPoints: 0.755, 0.05, 0.855, 0.06)
        case .EaseOutQuint: return CAMediaTimingFunction(controlPoints: 0.23, 1, 0.32, 1)
        case .EaseInOutQuint: return CAMediaTimingFunction(controlPoints: 0.86, 0, 0.07, 1)
        case .EaseInExpo: return CAMediaTimingFunction(controlPoints: 0.95, 0.05, 0.795, 0.035)
        case .EaseOutExpo: return CAMediaTimingFunction(controlPoints: 0.19, 1, 0.22, 1)
        case .EaseInOutExpo: return CAMediaTimingFunction(controlPoints: 1, 0, 0, 1)
        case .EaseInCirc: return CAMediaTimingFunction(controlPoints: 0.6, 0.04, 0.98, 0.335)
        case .EaseOutCirc: return CAMediaTimingFunction(controlPoints: 0.075, 0.82, 0.165, 1)
        case .EaseInOutCirc: return CAMediaTimingFunction(controlPoints: 0.785, 0.135, 0.15, 0.86)
        case .EaseInBack: return CAMediaTimingFunction(controlPoints: 0.6, -0.28, 0.735, 0.045)
        case .EaseOutBack: return CAMediaTimingFunction(controlPoints: 0.175, 0.885, 0.32, 1.275)
        case .EaseInOutBack: return CAMediaTimingFunction(controlPoints: 0.68, -0.55, 0.265, 1.55)
        case .Spring: return CAMediaTimingFunction(controlPoints: 0.5, 1.1+Float(1/3), 1, 1)
        }
    }
    var animationOption:UIViewAnimationOptions {
        switch self {
        case .EaseIn: return UIViewAnimationOptions.CurveEaseIn
        case .EaseOut: return UIViewAnimationOptions.CurveEaseOut
        case .EaseInOut: return UIViewAnimationOptions.CurveEaseInOut
        default: return UIViewAnimationOptions.CurveLinear
        }
    }
}

extension UIView {
    
    typealias AnimationCompletionHandler = () -> Void
    
    /**
     Animates using a predermined animation type and provides optional properties for customization.
     
     - Parameter animationType: The Animation type to use.
     - Parameter curve: The animation easing curve.
     - Parameter duration: The duration of the animation.
     - Parameter delay: The delay before animation begins.
     - Parameter force: The force of the movement.
     - Parameter damping: The damping of the force.
     - Parameter velocity: The velocity of the movement.
     - Parameter distance: The distance that it travels, like in the case of SlideLeft
     - Parameter fromRotation: The starting rotation.
     - Parameter fromScale: The starting scale.
     - Parameter fromX: The starting x offset.
     - Parameter fromY: The starting y offset.
     - Parameter completion: The completion handler that runs after animation is complete.
     */
    
    func animate(animationType:AnimationType, curve:AnimationEasingCurve, duration:CGFloat = 1, delay:CGFloat = 0, force:CGFloat = 1, damping:CGFloat = 0.7, velocity:CGFloat = 0.7, distance:CGFloat = 300.0, var fromRotation rotate:CGFloat = 0, fromScale scale:CGFloat = 1, var fromX x:CGFloat = 0, var fromY y:CGFloat = 0, completion: AnimationCompletionHandler? = nil)
    {
        var scaleX:CGFloat = scale
        var scaleY:CGFloat = scale
        var opacity:CGFloat = 0
        let repeatCount:Float = 1
        
        var animateFromInitialState = true
        
        alpha = 0.99
        
        switch animationType {
        case .SlideLeft:
            x = distance*force
        case .SlideRight:
            x = -distance*force
        case .SlideDown:
            y = -distance*force
        case .SlideUp:
            y = distance*force
        case .SqueezeLeft:
            x = distance
            scaleX = 3*force
        case .SqueezeRight:
            x = -distance
            scaleX = 3*force
        case .SqueezeDown:
            y = -distance
            scaleY = 3*force
        case .SqueezeUp:
            y = distance
            scaleY = 3*force
        case .FadeIn:
            opacity = 0
        case .FadeOut:
            animateFromInitialState = false
            opacity = 0
        case .FadeOutIn:
            let animation = CABasicAnimation()
            animation.keyPath = "opacity"
            animation.fromValue = 1
            animation.toValue = 0
            animation.timingFunction = curve.timingFunction
            animation.duration = CFTimeInterval(duration)
            animation.beginTime = CACurrentMediaTime() + CFTimeInterval(delay)
            animation.autoreverses = true
            layer.addAnimation(animation, forKey: "fade")
        case .FadeInLeft:
            opacity = 0
            x = distance*force
        case .FadeInRight:
            x = -distance*force
            opacity = 0
        case .FadeInDown:
            y = -distance*force
            opacity = 0
        case .FadeInUp:
            y = distance*force
            opacity = 0
        case .ZoomIn:
            opacity = 0
            scaleX = 2*force
            scaleY = 2*force
        case .ZoomOut:
            animateFromInitialState = false
            opacity = 0
            scaleX = 2*force
            scaleY = 2*force
        case .Fall:
            animateFromInitialState = false
            rotate = 15 * CGFloat(M_PI/180)
            y = distance*force
        case .Shake:
            let animation = CAKeyframeAnimation()
            animation.keyPath = "position.x"
            animation.values = [0, 30*force, -30*force, 30*force, 0]
            animation.keyTimes = [0, 0.2, 0.4, 0.6, 0.8, 1]
            animation.timingFunction = curve.timingFunction
            animation.duration = CFTimeInterval(duration)
            animation.additive = true
            animation.repeatCount = repeatCount
            animation.beginTime = CACurrentMediaTime() + CFTimeInterval(delay)
            layer.addAnimation(animation, forKey: "shake")
        case .Pop:
            let animation = CAKeyframeAnimation()
            animation.keyPath = "transform.scale"
            animation.values = [0, 0.2*force, -0.2*force, 0.2*force, 0]
            animation.keyTimes = [0, 0.2, 0.4, 0.6, 0.8, 1]
            animation.timingFunction = curve.timingFunction
            animation.duration = CFTimeInterval(duration)
            animation.additive = true
            animation.repeatCount = repeatCount
            animation.beginTime = CACurrentMediaTime() + CFTimeInterval(delay)
            layer.addAnimation(animation, forKey: "pop")
        case .FlipX:
            rotate = 0
            scaleX = 1
            scaleY = 1
            var perspective = CATransform3DIdentity
            perspective.m34 = -1.0 / layer.frame.size.width/2
            
            let animation = CABasicAnimation()
            animation.keyPath = "transform"
            animation.fromValue = NSValue(CATransform3D:
                CATransform3DMakeRotation(0, 0, 0, 0))
            animation.toValue = NSValue(CATransform3D:
                CATransform3DConcat(perspective, CATransform3DMakeRotation(CGFloat(M_PI), 0, 1, 0)))
            animation.duration = CFTimeInterval(duration)
            animation.beginTime = CACurrentMediaTime() + CFTimeInterval(delay)
            animation.timingFunction = curve.timingFunction
            layer.addAnimation(animation, forKey: "3d")
        case .FlipY:
            var perspective = CATransform3DIdentity
            perspective.m34 = -1.0 / layer.frame.size.width/2
            
            let animation = CABasicAnimation()
            animation.keyPath = "transform"
            animation.fromValue = NSValue(CATransform3D:
                CATransform3DMakeRotation(0, 0, 0, 0))
            animation.toValue = NSValue(CATransform3D:
                CATransform3DConcat(perspective,CATransform3DMakeRotation(CGFloat(M_PI), 1, 0, 0)))
            animation.duration = CFTimeInterval(duration)
            animation.beginTime = CACurrentMediaTime() + CFTimeInterval(delay)
            animation.timingFunction = curve.timingFunction
            layer.addAnimation(animation, forKey: "3d")
        case .Morph:
            let morphX = CAKeyframeAnimation()
            morphX.keyPath = "transform.scale.x"
            morphX.values = [1, 1.3*force, 0.7, 1.3*force, 1]
            morphX.keyTimes = [0, 0.2, 0.4, 0.6, 0.8, 1]
            morphX.timingFunction = curve.timingFunction
            morphX.duration = CFTimeInterval(duration)
            morphX.repeatCount = repeatCount
            morphX.beginTime = CACurrentMediaTime() + CFTimeInterval(delay)
            layer.addAnimation(morphX, forKey: "morphX")
            
            let morphY = CAKeyframeAnimation()
            morphY.keyPath = "transform.scale.y"
            morphY.values = [1, 0.7, 1.3*force, 0.7, 1]
            morphY.keyTimes = [0, 0.2, 0.4, 0.6, 0.8, 1]
            morphY.timingFunction = curve.timingFunction
            morphY.duration = CFTimeInterval(duration)
            morphY.repeatCount = repeatCount
            morphY.beginTime = CACurrentMediaTime() + CFTimeInterval(delay)
            layer.addAnimation(morphY, forKey: "morphY")
        case .Squeeze:
            let morphX = CAKeyframeAnimation()
            morphX.keyPath = "transform.scale.x"
            morphX.values = [1, 1.5*force, 0.5, 1.5*force, 1]
            morphX.keyTimes = [0, 0.2, 0.4, 0.6, 0.8, 1]
            morphX.timingFunction = curve.timingFunction
            morphX.duration = CFTimeInterval(duration)
            morphX.repeatCount = repeatCount
            morphX.beginTime = CACurrentMediaTime() + CFTimeInterval(delay)
            layer.addAnimation(morphX, forKey: "morphX")
            
            let morphY = CAKeyframeAnimation()
            morphY.keyPath = "transform.scale.y"
            morphY.values = [1, 0.5, 1, 0.5, 1]
            morphY.keyTimes = [0, 0.2, 0.4, 0.6, 0.8, 1]
            morphY.timingFunction = curve.timingFunction
            morphY.duration = CFTimeInterval(duration)
            morphY.repeatCount = repeatCount
            morphY.beginTime = CACurrentMediaTime() + CFTimeInterval(delay)
            layer.addAnimation(morphY, forKey: "morphY")
        case .Flash:
            let animation = CABasicAnimation()
            animation.keyPath = "opacity"
            animation.fromValue = 1
            animation.toValue = 0
            animation.duration = CFTimeInterval(duration)
            animation.repeatCount = repeatCount * 2.0
            animation.autoreverses = true
            animation.beginTime = CACurrentMediaTime() + CFTimeInterval(delay)
            layer.addAnimation(animation, forKey: "flash")
        case .Wobble:
            let animation = CAKeyframeAnimation()
            animation.keyPath = "transform.rotation"
            animation.values = [0, 0.3*force, -0.3*force, 0.3*force, 0]
            animation.keyTimes = [0, 0.2, 0.4, 0.6, 0.8, 1]
            animation.duration = CFTimeInterval(duration)
            animation.additive = true
            animation.beginTime = CACurrentMediaTime() + CFTimeInterval(delay)
            layer.addAnimation(animation, forKey: "wobble")
            
            let x = CAKeyframeAnimation()
            x.keyPath = "position.x"
            x.values = [0, 30*force, -30*force, 30*force, 0]
            x.keyTimes = [0, 0.2, 0.4, 0.6, 0.8, 1]
            x.timingFunction = curve.timingFunction
            x.duration = CFTimeInterval(duration)
            x.additive = true
            x.repeatCount = repeatCount
            x.beginTime = CACurrentMediaTime() + CFTimeInterval(delay)
            layer.addAnimation(x, forKey: "x")
        case .Swing:
            let animation = CAKeyframeAnimation()
            animation.keyPath = "transform.rotation"
            animation.values = [0, 0.3*force, -0.3*force, 0.3*force, 0]
            animation.keyTimes = [0, 0.2, 0.4, 0.6, 0.8, 1]
            animation.duration = CFTimeInterval(duration)
            animation.additive = true
            animation.beginTime = CACurrentMediaTime() + CFTimeInterval(delay)
            layer.addAnimation(animation, forKey: "swing")
        }
        
        if animateFromInitialState {
            let translate = CGAffineTransformMakeTranslation(x, y)
            let scale = CGAffineTransformMakeScale(scaleX, scaleY)
            let rotate = CGAffineTransformMakeRotation(rotate)
            let translateAndScale = CGAffineTransformConcat(translate, scale)
            self.transform = CGAffineTransformConcat(rotate, translateAndScale)
            alpha = opacity
        }
        
        UIView.animateWithDuration( NSTimeInterval(duration),
            delay: NSTimeInterval(delay),
            usingSpringWithDamping: damping,
            initialSpringVelocity: velocity,
            options: [curve.animationOption, UIViewAnimationOptions.AllowUserInteraction],
            animations: { [weak self] in
                if let _self = self {
                    if animateFromInitialState {
                        _self.transform = CGAffineTransformIdentity
                        _self.alpha = 1
                    } else {
                        let translate = CGAffineTransformMakeTranslation(x, y)
                        let scale = CGAffineTransformMakeScale(scaleX, scaleY)
                        let rotate = CGAffineTransformMakeRotation(rotate)
                        let translateAndScale = CGAffineTransformConcat(translate, scale)
                        _self.transform = CGAffineTransformConcat(rotate, translateAndScale)
                        _self.alpha = opacity
                    }
                }
            }, completion: { finished in
                completion?()
        })
    }
}

// MARK: - UIView IBInspectable
extension UIView {
    
    @IBInspectable var shadowColor: UIColor {
        get {
            return UIColor(CGColor: layer.shadowColor!)
        }
        set {
            layer.shadowColor = shadowColor.CGColor
        }
    }
    
    @IBInspectable var shouldRasterize: Bool {
        get {
            return layer.shouldRasterize
        }
        set {
            layer.shouldRasterize = shouldRasterize;
            if shouldRasterize{
                layer.rasterizationScale = UIScreen.mainScreen().scale
            }
        }
    }
    
    @IBInspectable var shadowOpacity: Float {
        get {
            return layer.shadowOpacity
        }
        set {
            layer.shadowOpacity = shadowOpacity
        }
    }
    
    @IBInspectable var shadowRadius: CGFloat {
        get {
            return layer.shadowRadius
        }
        set {
            layer.shadowRadius = shadowRadius
        }
    }
    
    @IBInspectable var shadowOffset: CGSize {
        get {
            return layer.shadowOffset
        }
        set {
            layer.shadowOffset = shadowOffset
        }
    }
    
    @IBInspectable var masksToBounds: Bool {
        get {
            return layer.masksToBounds
        }
        set {
           layer.masksToBounds = masksToBounds;
        }
    }
    
    @IBInspectable var cornerRadius: CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            layer.cornerRadius = newValue
            layer.masksToBounds = newValue > 0
        }
    }
    
    @IBInspectable var borderWidth: CGFloat {
        get {
            return layer.borderWidth
        }
        set {
            layer.borderWidth = newValue
        }
    }
    
    @IBInspectable var borderColor: UIColor? {
        get {
            return UIColor(CGColor: layer.borderColor!)
        }
        set {
            layer.borderColor = newValue?.CGColor
        }
    }
    
    @IBInspectable var leftBorderWidth: CGFloat {
        get {
            return 0.0   // Just to satisfy property
        }
        set {
            let line = UIView(frame: CGRect(x: 0.0, y: 0.0, width: newValue, height: bounds.height))
            line.translatesAutoresizingMaskIntoConstraints = false
            line.backgroundColor = UIColor(CGColor: layer.borderColor!)
            self.addSubview(line)
            
            let views = ["line": line]
            let metrics = ["lineWidth": newValue]
            addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("|[line(==lineWidth)]", options: [], metrics: metrics, views: views))
            addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("V:|[line]|", options: [], metrics: nil, views: views))
        }
    }
    
    @IBInspectable var topBorderWidth: CGFloat {
        get {
            return 0.0   // Just to satisfy property
        }
        set {
            let line = UIView(frame: CGRect(x: 0.0, y: 0.0, width: bounds.width, height: newValue))
            line.translatesAutoresizingMaskIntoConstraints = false
            line.backgroundColor = borderColor
            self.addSubview(line)
            
            let views = ["line": line]
            let metrics = ["lineWidth": newValue]
            addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("|[line]|", options: [], metrics: nil, views: views))
            addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("V:|[line(==lineWidth)]", options: [], metrics: metrics, views: views))
        }
    }
    
    @IBInspectable var rightBorderWidth: CGFloat {
        get {
            return 0.0   // Just to satisfy property
        }
        set {
            let line = UIView(frame: CGRect(x: bounds.width, y: 0.0, width: newValue, height: bounds.height))
            line.translatesAutoresizingMaskIntoConstraints = false
            line.backgroundColor = borderColor
            self.addSubview(line)
            
            let views = ["line": line]
            let metrics = ["lineWidth": newValue]
            addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("[line(==lineWidth)]|", options: [], metrics: metrics, views: views))
            addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("V:|[line]|", options: [], metrics: nil, views: views))
        }
    }
    @IBInspectable var bottomBorderWidth: CGFloat {
        get {
            return 0.0   // Just to satisfy property
        }
        set {
            let line = UIView(frame: CGRect(x: 0.0, y: bounds.height, width: bounds.width, height: newValue))
            line.translatesAutoresizingMaskIntoConstraints = false
            line.backgroundColor = borderColor
            self.addSubview(line)
            
            let views = ["line": line]
            let metrics = ["lineWidth": newValue]
            addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("|[line]|", options: [], metrics: nil, views: views))
            addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("V:[line(==lineWidth)]|", options: [], metrics: metrics, views: views))
        }
    }
    
}
// MARK: - AutoLayout

//
//  AFViewAutoLayout.swift
//  AFViewExtension: Version 4.0.1
//
//  Created by Melvin Rivera on 11/5/15.
//  Copyright © 2015 All Forces. All rights reserved.
//

/*
// Top Left Square
let topLeftSquare = UIView(autoLayout:true)
bigCircle.addSubview(topLeftSquare)
topLeftSquare.backgroundColor = UIColor(white: 0.1, alpha: 1)
topLeftSquare
.left(to: bigCircle)
.top(to: bigCircle)
.width(to: bigCircle, attribute: .Width, constant: 0, multiplier: 0.48)
.height(to: topLeftSquare, attribute: .Width)
.layoutIfNeeded()

// Top Right Square
let topRightSquare = UIView(autoLayout:true)
bigCircle.addSubview(topRightSquare)
topRightSquare.backgroundColor = UIColor(white: 0.1, alpha: 1)
topRightSquare
.right(to: bigCircle)
.top(to: bigCircle)
.size(to: topLeftSquare)
.layoutIfNeeded()

// Bottom Left Square
let bottomLeftSquare = UIView(autoLayout:true)
bigCircle.addSubview(bottomLeftSquare)
bottomLeftSquare.backgroundColor = UIColor(white: 0.1, alpha: 1)
bottomLeftSquare
.left(to: bigCircle)
.bottom(to: bigCircle)
.size(to: topLeftSquare)
.layoutIfNeeded()


// Bottom Right Square
let bottomRightSquare = UIView(autoLayout:true)
bigCircle.addSubview(bottomRightSquare)
bottomRightSquare.backgroundColor = UIColor(white:0.1, alpha: 1)
bottomRightSquare
.right(to: bigCircle)
.bottom(to: bigCircle)
.size(to: topLeftSquare)
.layoutIfNeeded()
*/

import Foundation
import UIKit

extension UIView {
    
    // MARK: Init
    
    /**
    Instantiates a new UIView with Auto Layout
    
    - Parameter autoLayout Enables Auto Layout.
    - Returns: self
    */
    convenience init(autoLayout: Bool = true)
    {
        self.init(frame:CGRectZero)
        self.translatesAutoresizingMaskIntoConstraints = !(autoLayout)
    }
    
    // MARK: Position
    
    /**
    Returns the frame's origin
    */
    
    func origin() -> CGPoint { return frame.origin }
    
    /**
     Sets the frame's top and left sides using Auto Layout or frames
     
     - Parameter constant: The CGPoint to ise as the origin
     - Returns: self
     */
    func origin(constant: CGPoint) -> UIView {
        if translatesAutoresizingMaskIntoConstraints {
            frame.origin = constant
            return self
        } else {
            return origin(to: superview!, constant: constant)
        }
    }
    /**
     Pins left and top sides to another view using Auto Layout
     
     - Parameter to: The view to pin to
     - Parameter constant: The offset to use after multiplication is done.
     - Parameter multiplier: The multiplier to use, i.e. 0.5 is half.
     - Returns: self UIView
     */
    func origin(to to:AnyObject, constant: CGPoint = CGPoint(x: 0, y: 0), multiplier:CGFloat = 1) -> UIView {
        var constraints = [NSLayoutConstraint]()
        if let left = pin(.Left, to: to, attribute: .Left, constant: constant.x, multiplier: multiplier) {
            constraints.append(left)
        }
        if let top = pin(.Top, to: to, attribute: .Top, constant: constant.y, multiplier: multiplier) {
            constraints.append(top)
        }
        return self
    }
    
    /**
     Returns the frame minimum x point
     */
    func left() -> CGFloat { return frame.origin.x }
    
    /**
     Sets the frame left side using Auto Layout or frames
     
     - Parameter constant: The value to use.
     - Returns: self
     */
    func left(constant: CGFloat) -> UIView {
        if translatesAutoresizingMaskIntoConstraints {
            frame.origin.x = constant
            return self
        } else {
            return left(to: superview!, attribute: .Left, constant: constant)
        }
    }
    
    /**
     Pins left side to another view using Auto Layout
     
     - Parameter to: The view to pin to
     - Parameter attribute: The attribute to pin to
     - Parameter constant: The offset to use after multiplication is done.
     - Parameter multiplier: The multiplier to use, i.e. 0.5 is half.
     - Returns: self
     */
    func left(to to:AnyObject, attribute: NSLayoutAttribute = .Left, constant: CGFloat = 0, multiplier:CGFloat = 1) -> UIView {
        pin(.Left, to: to, attribute: attribute, constant: constant, multiplier: multiplier)
        return self
    }
    
    /**
     Returns the frame leading value
     */
    func leading() -> CGFloat { return layoutDirectionIsLeftToRight() ? left() : right() }
    
    /**
     Sets the frame leading side using Auto Layout or frames
     
     - Parameter constant: The value to use.
     - Returns: self
     */
    func leading(constant: CGFloat) -> UIView {
        if translatesAutoresizingMaskIntoConstraints {
            return layoutDirectionIsLeftToRight() ? left(constant) : right(constant)
        } else {
            return leading(to: superview!, attribute: .Leading, constant: constant)
        }
    }
    
    /**
     Pins the frame leading side to another view using Auto Layout
     
     - Parameter to: The view to pin to
     - Parameter attribute: The attribute to pin to
     - Parameter constant: The offset to use after multiplication is done.
     - Parameter multiplier: The multiplier to use, i.e. 0.5 is half.
     - Returns: self
     */
    func leading(to to:AnyObject, attribute: NSLayoutAttribute = .Leading, constant: CGFloat = 0, multiplier:CGFloat = 1) -> UIView {
        pin(.Leading, to: to, attribute: attribute, constant: constant, multiplier: multiplier)
        return self
    }
    
    /**
     Returns the frame max x point
     */
    func right() -> CGFloat { return frame.origin.x + frame.size.width }
    
    /**
     Sets the frame right side using Auto Layout or frames
     
     - Parameter constant: The value to use.
     - Returns: self
     */
    func right(constant: CGFloat) -> UIView  {
        if translatesAutoresizingMaskIntoConstraints {
            return left(constant - width())
        } else {
            return right(to: superview!, attribute: .Right, constant: constant)
        }
    }
    /**
     Pins the frame right side to another view using Auto Layout
     
     - Parameter to: The view to pin to
     - Parameter attribute: The attribute to pin to
     - Parameter constant: The offset to use after multiplication is done.
     - Parameter multiplier: The multiplier to use, i.e. 0.5 is half.
     - Returns: self
     */
    func right(to to:AnyObject, attribute: NSLayoutAttribute = .Right, constant: CGFloat = 0, multiplier:CGFloat = 1) -> UIView {
        pin(.Right, to: to, attribute: attribute, constant: constant, multiplier: multiplier)
        return self
    }
    
    /**
     Returns the frame trailing value
     */
    func trailing() -> CGFloat { return layoutDirectionIsLeftToRight() ? right() : left() }
    
    /**
     Sets the frame trailing side using Auto Layout or frames
     
     - Parameter constant: The value to use
     - Returns: self UIView
     */
    func trailing(constant: CGFloat) -> UIView {
        if translatesAutoresizingMaskIntoConstraints {
            return layoutDirectionIsLeftToRight() ? right(constant) : left(constant)
        } else {
            return trailing(to: superview!, attribute: .Trailing, constant: constant)
        }
    }
    
    /**
     Pins the frame trailing side to another view using Auto Layout
     
     - Parameter to: The view to pin to
     - Parameter attribute: The attribute to pin to
     - Parameter constant: The offset to use after multiplication is done.
     - Parameter multiplier: The multiplier to use, i.e. 0.5 is half.
     - Returns: self
     */
    func trailing(to to:AnyObject, attribute: NSLayoutAttribute = .Trailing, constant: CGFloat = 0, multiplier:CGFloat = 1) -> UIView {
        pin(.Trailing, to: to, attribute: attribute, constant: constant, multiplier: multiplier)
        return self
    }
    
    /**
     Returns the frame top value
     */
    func top() -> CGFloat { return frame.origin.y }
    
    /**
     Sets the frame top side using Auto Layout or frames
     
     - Parameter constant: The value to use.
     - Returns: self
     */
    func top(constant: CGFloat) -> UIView {
        if translatesAutoresizingMaskIntoConstraints {
            frame.origin.y = constant
            return self
        } else {
            return top(to: superview!, attribute: .Top, constant: constant)
        }
    }
    
    /**
     Pins the frame trailing side to another view using Auto Layout
     
     - Parameter to: The view to pin to
     - Parameter attribute: The attribute to pin to
     - Parameter constant: The offset to use after multiplication is done.
     - Parameter multiplier: The multiplier to use, i.e. 0.5 is half.
     - Returns: self
     */
    func top(to to:AnyObject, attribute: NSLayoutAttribute = .Top, constant: CGFloat = 0, multiplier:CGFloat = 1) -> UIView {
        pin(.Top, to: to, attribute: attribute, constant: constant, multiplier: multiplier)
        return self
    }
    
    /**
     Returns the frame bottom value
     */
    func bottom() -> CGFloat { return top() + height() }
    
    /**
     Sets the frame bottom side using Auto Layout or frames
     
     - Parameter constant: The value to use.
     - Returns: self
     */
    func bottom(constant: CGFloat) -> UIView {
        if translatesAutoresizingMaskIntoConstraints {
            return top(constant - height())
        } else {
            return bottom(to: superview!, attribute: .Bottom, constant: constant)
        }
    }
    /**
     Pins the frame bottom side to another view using Auto Layout
     
     - Parameter to: The view to pin to
     - Parameter attribute: The attribute to pin to
     - Parameter constant: The offset to use after multiplication is done.
     - Parameter multiplier: The multiplier to use, i.e. 0.5 is half.
     - Returns: self
     */
    func bottom(to to:AnyObject, attribute: NSLayoutAttribute = .Bottom, constant: CGFloat = 0, multiplier:CGFloat = 1) -> UIView {
        pin(.Bottom, to: to, attribute: attribute, constant: constant, multiplier: multiplier)
        return self
    }
    
    /**
     Sets the center to it's superview using Auto Layout or frames
     
     - Parameter constant: The value to use.
     - Returns: self
     */
    func center(constant: CGPoint = CGPoint(x: 0, y: 0)) -> UIView {
        if translatesAutoresizingMaskIntoConstraints {
            center = constant
        } else {
            centerX(constant.x)
            centerY(constant.y)
        }
        return self
    }
    
    /**
     Pins the center point to another view using Auto Layout
     
     - Parameter to: The view to pin to
     - Parameter constant: The offset to use after multiplication is done.
     - Parameter multiplier: The multiplier to use, i.e. 0.5 is half.
     - Returns: self
     */
    func center(to to:AnyObject, constant:CGSize = CGSize(width: 0, height: 0), multiplier:CGFloat = 1) -> UIView  {
        var constraints = [NSLayoutConstraint]()
        if let centerX = pin(.CenterX, to: superview!, attribute: .CenterX, constant: constant.width, multiplier: multiplier) {
            constraints.append(centerX)
        }
        if let centerY = pin(.CenterY, to: superview!, attribute: .CenterY, constant: constant.height, multiplier: multiplier) {
            constraints.append(centerY)
        }
        return self
    }
    
    /**
     Returns the center X
     */
    func centerX() -> CGFloat { return center.x }
    
    /**
     Sets the center X using Auto Layout or frames
     
     - Parameter constant: The value to use.
     - Returns: self
     */
    func centerX(constant: CGFloat = 0) -> UIView {
        if translatesAutoresizingMaskIntoConstraints {
            center = CGPoint(x: superview!.width()/2 + constant , y: center.y)
        } else {
            pin(.CenterX, to: superview!, attribute: .CenterX, constant: constant)
        }
        return self
    }
    
    /**
     Pins the center X to another view using Auto Layout
     
     - Parameter to: The view to pin to
     - Parameter attribute: The attribute to pin to
     - Parameter constant: The offset to use after multiplication is done.
     - Parameter multiplier: The multiplier to use, i.e. 0.5 is half.
     - Returns: self
     */
    func centerX(to to:AnyObject, attribute: NSLayoutAttribute = .CenterX, constant: CGFloat = 0, multiplier:CGFloat = 1) -> UIView {
        pin(.CenterX, to: to, attribute: attribute, constant: constant, multiplier: multiplier)
        return self
    }
    
    /**
     Returns the center Y
     */
    func centerY() -> CGFloat { return center.y }
    
    /**
     Sets the center Y using Auto Layout or frames
     
     - Parameter constant: The value to use.
     - Returns: self
     */
    func centerY(constant: CGFloat = 0) -> UIView {
        if translatesAutoresizingMaskIntoConstraints {
            center = CGPoint(x: superview!.center.x, y: CGFloat(superview!.height()/2) + constant)
        } else {
            pin(.CenterY, to: superview!, attribute: .CenterY, constant: constant)
        }
        return self
    }
    
    /**
     Pins the center Y to another view using Auto Layout
     
     - Parameter to: The view to pin to
     - Parameter attribute: The attribute to pin to
     - Parameter constant: The offset to use after multiplication is done.
     - Parameter multiplier: The multiplier to use, i.e. 0.5 is half.
     - Returns: self
     */
    func centerY(to to:AnyObject, attribute: NSLayoutAttribute = .CenterY, constant: CGFloat = 0, multiplier:CGFloat = 1) -> UIView {
        pin(.CenterY, to: superview!, attribute: attribute, constant: constant)
        return self
    }
    
    // MARK: Compression and Hugging Priority
    
    /**
    Returns the Compression Resistance Priority for Horizontal Axis using Auto Layout
    */
    func horizontalCompressionPriority() -> UILayoutPriority { return contentCompressionResistancePriorityForAxis(.Horizontal) }
    
    /**
     Sets the Compression Resistance Priority for Horizontal Axis using Auto Layout
     
     - Returns: self
     */
    func horizontalCompressionPriority(priority: UILayoutPriority) -> UIView {
        if !translatesAutoresizingMaskIntoConstraints {
            setContentCompressionResistancePriority(priority, forAxis: .Horizontal)
        }
        return self
    }
    
    /**
     Returns the Compression Resistance Priority for Vertical Axis using Auto Layout
     */
    func verticalCompressionPriority() -> UILayoutPriority { return contentCompressionResistancePriorityForAxis(.Vertical) }
    
    /**
     Sets the Compression Resistance Priority for Vertical Axis using Auto Layout
     
     - Returns: self
     */
    func verticalCompressionPriority(priority: UILayoutPriority) -> UIView {
        if !translatesAutoresizingMaskIntoConstraints {
            setContentCompressionResistancePriority(priority, forAxis: .Vertical)
        }
        return self
    }
    
    /**
     Returns the Content Hugging Priority for Horizontal Axis using Auto Layout
     */
    func horizontalHuggingPriority() -> UILayoutPriority { return contentHuggingPriorityForAxis(.Horizontal) }
    
    /**
     Sets the Content Hugging Priority for Horizontal Axis using Auto Layout
     
     - Returns: self
     */
    func horizontalHuggingPriority(priority: UILayoutPriority) -> UIView {
        if !translatesAutoresizingMaskIntoConstraints {
            setContentHuggingPriority(priority, forAxis: .Horizontal)
        }
        return self
    }
    
    /**
     Returns the Content Hugging Priority for Vertical Axis using Auto Layout
     */
    func verticalHuggingPriority() -> UILayoutPriority { return contentHuggingPriorityForAxis(.Vertical) }
    
    /**
     Sets the Content Hugging Priority for Vertical Axis using Auto Layout
     
     - Returns: self
     */
    func verticalHuggingPriority(priority: UILayoutPriority) -> UIView {
        if !translatesAutoresizingMaskIntoConstraints {
            setContentHuggingPriority(priority, forAxis: .Vertical)
        }
        return self
    }
    
    
    // MARK: Size
    
    /**
    Returns the frame size
    */
    func size() -> CGSize { return frame.size }
    
    /**
     Sets the frame size using Auto Layout or frames
     
     - Parameter constant: The value to use.
     - Returns: self UIView
     */
    func size(constant: CGSize) -> UIView {
        if translatesAutoresizingMaskIntoConstraints {
            frame.size = constant
        } else {
            applyAttribute(.Width, constant: constant.width)
            applyAttribute(.Height, constant: constant.height)
        }
        return self
    }
    
    /**
     Pins the size to another view using Auto Layout
     
     - Parameter to: The view to pin to
     - Parameter constant: The offset to use after multiplication is done.
     - Parameter multiplier: The multiplier to use, i.e. 0.5 is half.
     - Returns: self
     */
    func size(to to:AnyObject, constant: CGSize = CGSize(width: 0, height: 0), multiplier:CGFloat = 1) -> UIView {
        if !translatesAutoresizingMaskIntoConstraints {
            var constraints = [NSLayoutConstraint]()
            if let width = pin(.Width, to: to, attribute: .Width, constant: constant.width, multiplier: multiplier) {
                constraints.append(width)
            }
            if let height = pin(.Height, to: to, attribute: .Height, constant: constant.height, multiplier: multiplier) {
                constraints.append(height)
            }
        }
        return self
    }
    
    /**
     Returns the frame width
     */
    func width() -> CGFloat { return frame.size.width }
    
    /**
     Sets the frame width using Auto Layout or frames
     
     - Parameter constant: The value to use.
     - Returns: self
     */
    func width(constant: CGFloat) -> UIView {
        if translatesAutoresizingMaskIntoConstraints {
            frame.size.width = constant
        } else {
            applyAttribute(.Width, constant: constant)
        }
        return self
    }
    
    /**
     Pins the width to another view using Auto Layout
     
     - Parameter to: The view to pin to
     - Parameter attribute: The attribute to pin to
     - Parameter constant: The offset to use after multiplication is done.
     - Parameter multiplier: The multiplier to use, i.e. 0.5 is half.
     - Returns: self
     */
    func width(to to:AnyObject, attribute: NSLayoutAttribute = .Width, constant: CGFloat = 0, multiplier:CGFloat = 1) -> UIView {
        if !translatesAutoresizingMaskIntoConstraints {
            pin(.Width, to: to, attribute: attribute, constant: constant, multiplier: multiplier)
        }
        return self
    }
    
    /**
     Returns the frame height
     */
    func height() -> CGFloat { return frame.size.height }
    
    /**
     Sets the frame height using Auto Layout or frames
     
     - Parameter constant: The value to use.
     - Returns: self UIView
     */
    func height(constant: CGFloat) -> UIView {
        if translatesAutoresizingMaskIntoConstraints {
            frame.size.height = constant
        } else {
            applyAttribute(.Height, constant: constant)
        }
        return self
    }
    
    /**
     Pins the height to another view using Auto Layout
     
     - Parameter to: The view to pin to
     - Parameter attribute: The attribute to pin to
     - Parameter constant: The offset to use after multiplication is done.
     - Parameter multiplier: The multiplier to use, i.e. 0.5 is half.
     - Returns: self
     */
    func height(to to:AnyObject, attribute: NSLayoutAttribute = .Height, constant: CGFloat = 0, multiplier:CGFloat = 1) -> UIView {
        if !translatesAutoresizingMaskIntoConstraints {
            pin(.Height, to: to, attribute: attribute, constant: constant, multiplier: multiplier)
        }
        return self
    }
    
    /**
     Returns the minimum size using Auto Layout
     */
    func minSize() -> CGSize? {
        if !translatesAutoresizingMaskIntoConstraints {
            if let minWidth = minWidth() {
                if let minHeight = minHeight() {
                    return CGSize(width: minWidth, height: minHeight)
                }
            }
        }
        return nil
    }
    
    /**
     Sets the minimum size using Auto Layout
     
     - Parameter constant: The value to use.
     - Returns: self
     */
    func minSize(constant:CGSize) -> UIView {
        if !translatesAutoresizingMaskIntoConstraints {
            applyAttribute(.Width, constant: constant.width, multiplier: 1, relation: .GreaterThanOrEqual)
            applyAttribute(.Height, constant: constant.height, multiplier: 1, relation: .GreaterThanOrEqual)
        }
        return self
    }
    
    /**
     Pins the minimum size to another view using Auto Layout
     
     - Parameter to: The view to pin to
     - Parameter constant: The offset to use after multiplication is done.
     - Parameter multiplier: The multiplier to use, i.e. 0.5 is half.
     - Returns: self
     */
    func minSize(to to:AnyObject, constant:CGSize = CGSize(width: 0, height: 0), multiplier:CGFloat = 1) -> UIView {
        if !translatesAutoresizingMaskIntoConstraints {
            var constraints = [NSLayoutConstraint]()
            if let width = pin(.Width, to: to, attribute: .Width, constant: constant.width, multiplier: multiplier, relation: .GreaterThanOrEqual) {
                constraints.append(width)
            }
            if let height = pin(.Width, to: to, attribute: .Height, constant: constant.height, multiplier: multiplier, relation: .GreaterThanOrEqual) {
                constraints.append(height)
            }
        }
        return self
    }
    
    /**
     Returns the minimum width using Auto Layout
     */
    func minWidth() -> CGFloat? {
        if !translatesAutoresizingMaskIntoConstraints {
            for constrain in constraints {
                if constrain.firstAttribute == .Width && constrain.firstItem as! NSObject == self && constrain.secondItem == nil && constrain.relation == .GreaterThanOrEqual {
                    return constrain.constant
                }
            }
        }
        return nil
    }
    
    /**
     Sets the minimum width using Auto Layout
     
     - Parameter constant: The value to use.
     - Returns: self
     */
    func minWidth(constant:CGFloat) -> UIView {
        if !translatesAutoresizingMaskIntoConstraints {
            applyAttribute(.Width, constant: constant, multiplier: 1, relation: .GreaterThanOrEqual)
        }
        return self
    }
    
    /**
     Pins the minimum width to another view using Auto Layout
     
     - Parameter to: The view to pin to
     - Parameter attribute: The attribute to pin to
     - Parameter constant: The offset to use after multiplication is done.
     - Parameter multiplier: The multiplier to use, i.e. 0.5 is half.
     - Returns: self
     */
    func minWidth(to to:AnyObject, attribute: NSLayoutAttribute = .Width, constant:CGFloat = 0, multiplier:CGFloat = 1) -> UIView {
        if !translatesAutoresizingMaskIntoConstraints {
            pin(.Width, to: to, attribute: attribute, constant: constant, multiplier: multiplier, relation: .GreaterThanOrEqual)
        }
        return self
    }
    
    /**
     Returns the minimum height using Auto Layout
     */
    func minHeight() -> CGFloat? {
        if !translatesAutoresizingMaskIntoConstraints {
            for constrain in constraints {
                if constrain.firstAttribute == .Height && constrain.firstItem as! NSObject == self && constrain.secondItem == nil && constrain.relation == .GreaterThanOrEqual {
                    return constrain.constant
                }
            }
        }
        return nil
    }
    
    /**
     Sets the minimum height using Auto Layout
     
     - Parameter constant: The value to use.
     - Returns: self
     */
    func minHeight(constant:CGFloat) -> UIView {
        if !translatesAutoresizingMaskIntoConstraints {
            applyAttribute(.Height, constant: constant, multiplier: 1, relation: .GreaterThanOrEqual)
        }
        return self
    }
    
    /**
     Pins the minimum height to another view using Auto Layout
     
     - Parameter to: The view to pin to
     - Parameter attribute: The attribute to pin to
     - Parameter constant: The offset to use after multiplication is done.
     - Parameter multiplier: The multiplier to use, i.e. 0.5 is half.
     - Returns: self
     */
    func minHeight(to to:AnyObject, attribute: NSLayoutAttribute = .Height, constant:CGFloat = 0, multiplier:CGFloat = 1) -> UIView {
        if !translatesAutoresizingMaskIntoConstraints {
            pin(.Height, to: to, attribute: attribute, constant: constant, multiplier: multiplier, relation: .GreaterThanOrEqual)
        }
        return self
    }
    
    /**
     Returns the maximun size using Auto Layout
     */
    func maxSize() -> CGSize? {
        if !translatesAutoresizingMaskIntoConstraints {
            if let maxWidth = maxWidth() {
                if let maxHeight = maxHeight() {
                    return CGSize(width: maxWidth, height: maxHeight)
                }
            }
        }
        return nil
    }
    
    /**
     Sets the maximun size using Auto Layout
     
     - Parameter constant: The value to use.
     - Returns: self
     */
    func maxSize(constant:CGSize) -> UIView {
        if !translatesAutoresizingMaskIntoConstraints {
            applyAttribute(.Width, constant: constant.width, multiplier: 1, relation: .LessThanOrEqual)
            applyAttribute(.Height, constant: constant.height, multiplier: 1, relation: .LessThanOrEqual)
        }
        return self
    }
    
    /**
     Pins the maximun size to another view using Auto Layout
     
     - Parameter to: The view to pin to
     - Parameter constant: The offset to use after multiplication is done.
     - Parameter multiplier: The multiplier to use, i.e. 0.5 is half.
     - Returns: self
     */
    func maxSize(to to:AnyObject, constant:CGSize = CGSize(width: 0, height: 0), multiplier:CGFloat = 1) -> UIView {
        if !translatesAutoresizingMaskIntoConstraints {
            var constraints = [NSLayoutConstraint]()
            if let width = pin(.Width, to: to, attribute: .Width, constant: constant.width, multiplier: multiplier, relation: .LessThanOrEqual) {
                constraints.append(width)
            }
            if let height = pin(.Width, to: to, attribute: .Height, constant: constant.height, multiplier: multiplier, relation: .LessThanOrEqual) {
                constraints.append(height)
            }
        }
        return self
    }
    
    /**
     Returns the maximun width using Auto Layout
     */
    func maxWidth() -> CGFloat? {
        if !translatesAutoresizingMaskIntoConstraints {
            for constrain in constraints {
                if constrain.firstAttribute == .Width && constrain.firstItem as! NSObject == self && constrain.secondItem == nil && constrain.relation == .LessThanOrEqual {
                    return constrain.constant
                }
            }
        }
        return nil
    }
    
    /**
     Sets the maximun width using Auto Layout
     
     - Parameter constant: The value to use.
     - Returns: self
     */
    func maxWidth(constant:CGFloat) -> UIView {
        if !translatesAutoresizingMaskIntoConstraints {
            applyAttribute(.Width, constant: constant, multiplier: 1, relation: .LessThanOrEqual)
        }
        return self
    }
    
    /**
     Pins the maximun width to another view using Auto Layout
     
     - Parameter to: The view to pin to
     - Parameter attribute: The attribute to pin to
     - Parameter constant: The offset to use after multiplication is done.
     - Parameter multiplier: The multiplier to use, i.e. 0.5 is half.
     - Returns: self
     */
    func maxWidth(to to:AnyObject, attribute: NSLayoutAttribute = .Width, constant:CGFloat = 0, multiplier:CGFloat = 1) -> UIView {
        if !translatesAutoresizingMaskIntoConstraints {
            pin(.Width, to: to, attribute: attribute, constant: constant, multiplier: multiplier, relation: .LessThanOrEqual)
        }
        return self
    }
    
    /**
     Returns the maximun height using Auto Layout
     */
    func maxHeight() -> CGFloat? {
        if !translatesAutoresizingMaskIntoConstraints {
            for constrain in constraints {
                if constrain.firstAttribute == .Height && constrain.firstItem as! NSObject == self && constrain.secondItem == nil && constrain.relation == .LessThanOrEqual {
                    return constrain.constant
                }
            }
        }
        return nil
    }
    
    /**
     Sets the maximun height using Auto Layout
     
     - Parameter constant: The value to use.
     - Returns: self
     */
    func maxHeight(constant:CGFloat) -> UIView {
        if !translatesAutoresizingMaskIntoConstraints {
            applyAttribute(.Height, constant: constant, multiplier: 1, relation: .LessThanOrEqual)
        }
        return self
    }
    
    /**
     Pins the maximun height to another view using Auto Layout
     
     - Parameter to: The view to pin to
     - Parameter attribute: The attribute to pin to
     - Parameter constant: The offset to use after multiplication is done.
     - Parameter multiplier: The multiplier to use, i.e. 0.5 is half.
     - Returns: self
     */
    func maxHeight(to to:AnyObject, attribute: NSLayoutAttribute = .Height, constant:CGFloat = 0, multiplier:CGFloat = 1) -> UIView {
        if !translatesAutoresizingMaskIntoConstraints {
            pin(.Height, to: to, attribute: attribute, constant: constant, multiplier: multiplier, relation: .LessThanOrEqual)
        }
        return self
    }
    
    /**
     Returns the length of the smallest side
     */
    func smallestSideLength() -> CGFloat
    {
        return min(width(), height())
    }
    
    /**
     Returns the length of the largest side
     */
    func largestSideLength() -> CGFloat
    {
        return max(width(), height())
    }
    
    
    // MARK: AutoLayout state
    
    /**
    Prepares the view for a frame based animation by removing the view, enabling translatesAutoresizingMaskIntoConstraints and re-adding the view to it's superview
    */
    func prepForAnimation()
    {
        if superview != nil {
            let aSuperview = superview!
            removeFromSuperview()
            translatesAutoresizingMaskIntoConstraints = true
            aSuperview.addSubview(self)
        }
    }
    
    /**
     Prepares the view for Auto Layout by removing the view, disabling translatesAutoresizingMaskIntoConstraints and re-adding the view to it's superview
     */
    func prepForAutoLayout()
    {
        if superview != nil {
            let aSuperview = superview!
            removeFromSuperview()
            translatesAutoresizingMaskIntoConstraints = false
            aSuperview.addSubview(self)
        }
    }
    
    
    // MARK: Pin and Apply
    
    /**
    Pins an attribute to another view
    
    - Parameter pinAttribute: The View's attribut to pin
    - Parameter to: The view to pin to
    - Parameter attribute: The Attribute to pin to
    - Parameter constant: The offset to use after multiplication is done.
    - Parameter multiplier: The multiplier to use, i.e. 0.5 is half.
    - Parameter relation: The Relation to use
    - Returns: NSLayoutConstraint
    */
    func pin(pinAttribute:NSLayoutAttribute, to:AnyObject? = nil, attribute:NSLayoutAttribute, constant:CGFloat = 0, multiplier:CGFloat = 1, relation:NSLayoutRelation = .Equal) -> NSLayoutConstraint? {
        if !translatesAutoresizingMaskIntoConstraints {
            if self.superview == nil {
                print("WARNING: No superview found for pinning")
                return nil
            }
            var superview: UIView!
            if (to != nil) {
                superview = to is UIView ? commonSuperviewWithView(to! as! UIView)! : self.superview
            } else {
                superview = self.superview
            }
            let constraint = NSLayoutConstraint(item: self, attribute: pinAttribute, relatedBy: relation, toItem: to, attribute: attribute, multiplier: multiplier, constant: constant)
            superview?.addConstraint(constraint)
            return constraint
        }
        return nil
    }
    
    /**
     Applies an attribute to the view
     
     - Parameter attribute:  Attribute to apply
     - Parameter constant: The offset to use after multiplication is done.
     - Parameter multiplier: The multiplier to use, i.e. 0.5 is half.
     - Parameter relation: The Relation to use
     - Returns: NSLayoutConstraint
     */
    func applyAttribute(attribute:NSLayoutAttribute, constant:CGFloat = 0, multiplier: CGFloat = 1, relation:NSLayoutRelation = .Equal) -> NSLayoutConstraint  {
        let constraint = NSLayoutConstraint(item: self, attribute: attribute, relatedBy: relation, toItem: nil, attribute: .NotAnAttribute, multiplier: multiplier, constant: constant)
        addConstraint(constraint)
        return constraint
    }
    
    // MARK: Removing Constraints
    
    /**
    Removes all attached constraints recursevely
    
    - Returns: self
    */
    func removeAttachedConstraintsRecursevely() -> UIView
    {
        for constraint in constraints {
            print("constraint \(constraint)")
            removeConstraintRecursevely(constraint )
        }
        for constraint in superview!.constraints {
            let firstView = constraint.firstItem as! UIView
            if let _ = constraint.secondItem as? UIView {
                if firstView == self {
                    firstView.removeConstraintRecursevely(constraint )
                }
            }
        }
        return self
    }
    
    /**
     Removes a constraint recursevely
     
     - Returns: self
     */
    func removeConstraintRecursevely(constraint:NSLayoutConstraint) -> UIView
    {
        let firstView = constraint.firstItem as! UIView
        if constraint.secondItem != nil {
            var commonSuperview = firstView.commonSuperviewWithView(constraint.secondItem as! UIView)
            var constraintFound = false
            while constraintFound == false {
                for _ in commonSuperview!.constraints {
                    constraintFound = true
                }
                if constraintFound == true {
                    commonSuperview!.removeConstraint(constraint)
                    return self
                }
                commonSuperview = commonSuperview?.superview
            }
        } else {
            constraint.firstItem.removeConstraint(constraint)
        }
        return self
    }
    
    
    // MARK: Direction
    
    /**
    Returns true if layout direction is left to right
    */
    func layoutDirectionIsLeftToRight() -> Bool {
        return (UIApplication.sharedApplication().userInterfaceLayoutDirection == .LeftToRight)
    }
    
    
    
    // MARK: Private
    
    /**
    Finds the nearest common superview
    
    - Returns: UIVIew?
    */
    private func commonSuperviewWithView(view:UIView) -> UIView?
    {
        var commonSuperview: UIView? = nil
        var checkView: UIView? = self
        repeat {
            if view.isDescendantOfView(checkView!) {
                commonSuperview = checkView!
            }
            checkView = checkView!.superview
        } while (checkView) != nil
        return commonSuperview
    }
    
}
