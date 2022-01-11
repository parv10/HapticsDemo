//
//  PulseAnimation.swift
//  SearchSpeechToText
//
//  Created by Ranosys_ShubhamAgarwal on 23/01/19.
//  Copyright © 2019 Ranosys_ShubhamAgarwal. All rights reserved.
//

import UIKit

final public class PulseAnimation: CALayer, PulseAnimationProtocol
{
    private var animationGroup = CAAnimationGroup()
    private var radius: CGFloat = 200
    private var numebrOfPulse: Float = 1
    private var animationDuration: TimeInterval = 1

    private enum Constant
    {
        static let animationKey = "pulse"
        static let basicAnimationKeyPath = "transform.scale.xy"
        static let opacityAnimationkeyPath = "opacity"
        static let opacityAnimationValues = [0.4, 0.8, 0]
        static let opacityAnimationKeyTimes: [NSNumber] = [0, 0.3, 1]
    }

    public var dataModel: PulseModel?
    {
        didSet
        {
            guard let dataModel = dataModel
            else
            {
                return
            }

            self.radius = dataModel.radius
            self.position = dataModel.position
            self.backgroundColor = dataModel.backgroundColor
            self.cornerRadius = dataModel.radius

            self.bounds = CGRect(x: .zero, y: .zero, width: radius*2, height: radius*2)

            DispatchQueue.global(qos: .default).async
            {
                self.setupAnimationGroup()

                DispatchQueue.main.async
                {
                    self.add(self.animationGroup, forKey: Constant.animationKey)
               }
            }
        }
    }

    required public init?(coder: NSCoder)
    {
        fatalError("init(coder:) has not been implemented")
    }

    required public override init()
    {
        super.init()
        self.backgroundColor = UIColor.black.cgColor
        self.contentsScale = UIScreen.main.scale
        self.opacity = .zero
    }

    private func scaleAnimation() -> CABasicAnimation
    {
        let scaleAnimaton = CABasicAnimation(keyPath: Constant.basicAnimationKeyPath)
        scaleAnimaton.fromValue = NSNumber(value: 0)
        scaleAnimaton.toValue = NSNumber(value: 1)
        scaleAnimaton.duration = animationDuration
        return scaleAnimaton
    }

    private func createOpacityAnimation() -> CAKeyframeAnimation
    {
        let opacityAnimiation = CAKeyframeAnimation(keyPath: Constant.opacityAnimationkeyPath)
        opacityAnimiation.duration = animationDuration
        opacityAnimiation.values = Constant.opacityAnimationValues
        opacityAnimiation.keyTimes = Constant.opacityAnimationKeyTimes
        return opacityAnimiation
    }

    private func setupAnimationGroup()
    {
        self.animationGroup.duration = animationDuration
        self.animationGroup.repeatCount = numebrOfPulse
        let defaultCurve = CAMediaTimingFunction(name: CAMediaTimingFunctionName.default)
        self.animationGroup.timingFunction = defaultCurve
        self.animationGroup.animations = [scaleAnimation(), createOpacityAnimation()]
    }
}
