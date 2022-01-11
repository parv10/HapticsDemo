//
//  File.swift
//
//
//  Created by Parv Bhaskar on 22/12/21.
//

import UIKit

class Toast
{
    private enum Constant
    {
        static let shadowOffset = CGSize(width: 4, height: 3)
        static let shadowOpacity: Float = 0.3
        static let animationDuration: Double = 2.0
        static let springDamping: CGFloat = 0.5
        static let springVelocity: CGFloat = 0.1
        static let animationDelay: CGFloat = 2.0
        static let labelYposition: CGFloat = 64
        static let labelHeight: CGFloat = 44
        static let labelAlpha: CGFloat = 1
        static let cornerRadius: CGFloat = 10
        static let padding: CGFloat = 10
        static let emptyString = ""
    }

    private static let backgroundColor = UIColor(red: 8/255, green: 56/255, blue: 42/255, alpha: 1)
    private static let textFont = UIColor(red: 8/255, green: 56/255, blue: 42/255, alpha: 1)

    static func showToast(message:String)
    {
        let appDelegate = UIApplication.shared.delegate
        let windowFrame = appDelegate?.window??.frame
        let textLabel = UILabel(frame: CGRect.zero)
        textLabel.textAlignment = NSTextAlignment.center

        textLabel.font = UIFont(name: "NeueHaasUnicaPro-Regular", size: 20)
        textLabel.adjustsFontSizeToFitWidth = true

        textLabel.backgroundColor =  backgroundColor
        textLabel.textColor = UIColor.white

        textLabel.sizeToFit()
        textLabel.numberOfLines = .zero
        textLabel.layer.shadowColor = UIColor.gray.cgColor
        textLabel.layer.shadowOffset = Constant.shadowOffset
        textLabel.layer.shadowOpacity = Constant.shadowOpacity
        textLabel.alpha = Constant.labelAlpha
        textLabel.layer.cornerRadius = Constant.cornerRadius
        textLabel.layer.masksToBounds = true

        textLabel.text = message
        textLabel.frame = CGRect(x: windowFrame?.size.width ?? .zero, y: Constant.labelYposition, width: (windowFrame?.size.width ?? .zero) - Constant.padding, height: Constant.labelHeight)

        appDelegate?.window??.addSubview(textLabel)

        var basketTopFrame: CGRect = textLabel.frame
        basketTopFrame.origin.x = Constant.padding * 0.5

        UIView.animate(withDuration: Constant.animationDuration,
                       delay: .zero,
                       usingSpringWithDamping: Constant.springDamping,
                       initialSpringVelocity: Constant.springVelocity,
                       options: UIView.AnimationOptions.curveEaseOut,
                       animations: { () -> Void in
            textLabel.frame = basketTopFrame
        }, completion: { _ in
            UIView.animate(withDuration: Constant.animationDuration,
                           delay: Constant.animationDelay,
                           usingSpringWithDamping: Constant.springDamping,
                           initialSpringVelocity: Constant.springVelocity,
                           options: UIView.AnimationOptions.curveEaseIn,
                           animations: { () -> Void in
                textLabel.alpha = .zero
            }, completion: { _ in
                textLabel.removeFromSuperview()
            })
        })
    }

    private static func getBackgroundColor(_ red: CGFloat, _ green: CGFloat, _ blue: CGFloat) -> UIColor
    {
        return UIColor(red: red/255, green: green/255, blue: blue/255, alpha: 1)
    }
}
