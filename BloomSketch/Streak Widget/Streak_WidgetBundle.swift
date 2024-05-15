//
//  Streak_WidgetBundle.swift
//  Streak Widget
//
//  Created by MacBook Pro on 11/05/24.
//

import WidgetKit
import SwiftUI

@main
struct Streak_WidgetBundle: WidgetBundle {
    var body: some Widget {
        Streak_Widget()
        Streak_WidgetLiveActivity()
    }
}
