//
//  File.swift
//
//
//  Created by Parv Bhaskar on 04/01/22.
//

import Foundation
import UIKit

public
protocol PulseAnimationProtocol: CALayer
{
    init()

    var dataModel: PulseModel? { get set }
}
