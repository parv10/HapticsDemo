//
//  File.swift
//
//
//  Created by Parv Bhaskar on 03/01/22.
//

import Foundation

public
protocol HapticsRouter
{
    func generateImpactFeedbackStyle(_ type: ImpactFeedbackType)
    func generateUINotificationFeedbackStyle(_ type: UINotificationFeedbackType)
}
