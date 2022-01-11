//
//  File.swift
//
//
//  Created by Parv Bhaskar on 04/01/22.
//

import UIKit

public struct PulseModel
{
    let radius: CGFloat
    let position: CGPoint
    let backgroundColor: CGColor
    public var numebrOfPulse: Float?
    public var animationDuration: TimeInterval?

    public init(radius: CGFloat,
                position: CGPoint,
                backgroundColor: CGColor)
    {
        self.radius = radius
        self.position = position
        self.backgroundColor = backgroundColor
    }
}
