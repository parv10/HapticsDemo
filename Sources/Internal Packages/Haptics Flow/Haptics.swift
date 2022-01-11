//
//  File.swift
//
//
//  Created by Parv Bhaskar on 21/12/21.
//

import UIKit

final class Haptics: HapticsRouter
{
    func generateImpactFeedbackStyle(_ type: ImpactFeedbackType)
    {
        if #available(iOS 10.0, *)
        {
            switch type
            {
                case .heavy:
                    let hapticFeedbackGenerator = UIImpactFeedbackGenerator(style: .heavy)

                    hapticFeedbackGenerator.impactOccurred()
                default:
                    let hapticFeedbackGenerator = UIImpactFeedbackGenerator(style: .light)

                    hapticFeedbackGenerator.impactOccurred()
            }

            showToastForSimulator()
        }
        else
        {
            // Do nothing
        }
    }

    func generateUINotificationFeedbackStyle(_ type: UINotificationFeedbackType)
    {
        if #available(iOS 10.0, *)
        {
            let generator = UINotificationFeedbackGenerator()

            switch type
            {
                case .success:
                    generator.notificationOccurred(.success)
                default:
                    generator.notificationOccurred(.error)
            }

            showToastForSimulator()
        }
        else
        {
            // Do nothing
        }
    }

    private func showToastForSimulator()
    {
        #if targetEnvironment(simulator)
            Toast.showToast(message: "Haptics event triggered")
        #else
            // Do nothing
        #endif
    }
}
