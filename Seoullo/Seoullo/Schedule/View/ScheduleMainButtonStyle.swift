//
//  ScheduleMainButtonStyle.swift.swift
//  Seoullo
//
//  Created by 김혜수 on 9/11/24.
//

import SwiftUI

struct ScheduleMainButtonStyle: ButtonStyle {
    let textColor: Color
    let backgroundColor: Color

    init(textColor: Color? = nil, backgroundColor: Color? = nil) {
        self.textColor = textColor ?? .white
        self.backgroundColor = backgroundColor ?? .point
    }

    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .font(.system(size: 20))
            .foregroundStyle(textColor)
            .frame(maxWidth: .infinity)
            .frame(height: 50)
            .background(
                RoundedRectangle(cornerRadius: 15)
                    .fill(backgroundColor)
            )
            .opacity(configuration.isPressed ? 0.5 : 1)
    }
}
