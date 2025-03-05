//
//  ReminderBundle.swift
//  Reminder
//
//  Created by Sajim  on 06/12/1403 AP.
//

import WidgetKit
import SwiftUI

@main
struct ReminderBundle: WidgetBundle {
    var body: some Widget {
        Reminder()
        ReminderControl()
        ReminderLiveActivity()
    }
}
