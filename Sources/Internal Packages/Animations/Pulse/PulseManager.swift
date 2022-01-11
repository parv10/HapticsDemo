//
//  File.swift
//
//
//  Created by Parv Bhaskar on 04/01/22.
//

import Foundation

final public class PulseManager
{
    public let shared: PulseAnimationProtocol = PulseAnimation()

    public class func getPulseAnimation() -> PulseAnimationProtocol
    {
        PulseAnimation()
    }
}
