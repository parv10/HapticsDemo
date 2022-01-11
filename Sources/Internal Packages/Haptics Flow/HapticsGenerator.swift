//
//  File.swift
//
//
//  Created by Parv Bhaskar on 03/01/22.
//

import Foundation

final public class HapticsGenerator
{
    private init() {}

    public static let shared: HapticsRouter = Haptics()
}
