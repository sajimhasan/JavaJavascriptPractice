//
//  ReminderLiveActivity.swift
//  Reminder
//
//  Created by Sajim  on 06/12/1403 AP.
//

import ActivityKit
import WidgetKit
import SwiftUI

struct ReminderAttributes: ActivityAttributes {
    public struct ContentState: Codable, Hashable {
        // Dynamic stateful properties about your activity go here!
        var emoji: String
    }

    // Fixed non-changing properties about your activity go here!
    var name: String
}

struct ReminderLiveActivity: Widget {
    var body: some WidgetConfiguration {
        ActivityConfiguration(for: ReminderAttributes.self) { context in
            // Lock screen/banner UI goes here
            VStack {
                Text("Hello \(context.state.emoji)")
            }
            .activityBackgroundTint(Color.cyan)
            .activitySystemActionForegroundColor(Color.black)

        } dynamicIsland: { context in
            DynamicIsland {
                // Expanded UI goes here.  Compose the expanded UI through
                // various regions, like leading/trailing/center/bottom
                DynamicIslandExpandedRegion(.leading) {
                    Text("Leading")
                }
                DynamicIslandExpandedRegion(.trailing) {
                    Text("Trailing")
                }
                DynamicIslandExpandedRegion(.bottom) {
                    Text("Bottom \(context.state.emoji)")
                    // more content
                }
            } compactLeading: {
                Text("L")
            } compactTrailing: {
                Text("T \(context.state.emoji)")
            } minimal: {
                Text(context.state.emoji)
            }
            .widgetURL(URL(string: "http://www.apple.com"))
            .keylineTint(Color.red)
        }
    }
}

extension ReminderAttributes {
    fileprivate static var preview: ReminderAttributes {
        ReminderAttributes(name: "World")
    }
}

extension ReminderAttributes.ContentState {
    fileprivate static var smiley: ReminderAttributes.ContentState {
        ReminderAttributes.ContentState(emoji: "😀")
     }
     
     fileprivate static var starEyes: ReminderAttributes.ContentState {
         ReminderAttributes.ContentState(emoji: "🤩")
     }
}

#Preview("Notification", as: .content, using: ReminderAttributes.preview) {
   ReminderLiveActivity()
} contentStates: {
    ReminderAttributes.ContentState.smiley
    ReminderAttributes.ContentState.starEyes
}
