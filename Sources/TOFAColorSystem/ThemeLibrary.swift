import SwiftUI
import Foundation

public enum TOFAThemeLibrary {
    public static let shellDay = TOFAShellReference(
        paperHex: "#F1F4F8",
        inkHex: "#202A38",
        quietInkHex: "#6A7384"
    )

    public static let shellNight = TOFAShellReference(
        paperHex: "#EEE8E3",
        inkHex: "#23201E",
        quietInkHex: "#8F8680"
    )

    public static let months: [TOFAMonth: TOFAMonthColors] = [
        .january: TOFAMonthColors(monthName: "January", attentionName: "Signal Blue", attentionKey: "signal_blue", topographyHex: "#CCDFFF", darkInkHex: "#233246", midInkHex: "#5A6F86", attentionHex: "#5457E8"),
        .february: TOFAMonthColors(monthName: "February", attentionName: "Air Blue", attentionKey: "air_blue", topographyHex: "#BAE4FA", darkInkHex: "#1F3845", midInkHex: "#597B8C", attentionHex: "#0072E7"),
        .march: TOFAMonthColors(monthName: "March", attentionName: "Tide Teal", attentionKey: "tide_teal", topographyHex: "#B3E7EE", darkInkHex: "#203D3F", midInkHex: "#5B7C7D", attentionHex: "#0D828E"),
        .april: TOFAMonthColors(monthName: "April", attentionName: "Sprout Green", attentionKey: "sprout_green", topographyHex: "#C6E6CD", darkInkHex: "#24392E", midInkHex: "#5E7A67", attentionHex: "#27864E"),
        .may: TOFAMonthColors(monthName: "May", attentionName: "Leaf Lime", attentionKey: "leaf_lime", topographyHex: "#D9E2C1", darkInkHex: "#3D402A", midInkHex: "#787B58", attentionHex: "#637F18"),
        .june: TOFAMonthColors(monthName: "June", attentionName: "Pollen Gold", attentionKey: "pollen_gold", topographyHex: "#EBDDBD", darkInkHex: "#4A3C24", midInkHex: "#8B7650", attentionHex: "#956F16"),
        .july: TOFAMonthColors(monthName: "July", attentionName: "Apricot Flame", attentionKey: "apricot_flame", topographyHex: "#F0DBBE", darkInkHex: "#4A3627", midInkHex: "#8D6E56", attentionHex: "#B95B17"),
        .august: TOFAMonthColors(monthName: "August", attentionName: "Coral Pulse", attentionKey: "coral_pulse", topographyHex: "#FDD6C5", darkInkHex: "#4A312D", midInkHex: "#8E6B63", attentionHex: "#DD3423"),
        .september: TOFAMonthColors(monthName: "September", attentionName: "Rose Signal", attentionKey: "rose_signal", topographyHex: "#FFD4CE", darkInkHex: "#4D2F35", midInkHex: "#91656F", attentionHex: "#D13E63"),
        .october: TOFAMonthColors(monthName: "October", attentionName: "Berry Magenta", attentionKey: "berry_magenta", topographyHex: "#FFD3DF", darkInkHex: "#4A2E3D", midInkHex: "#8A6678", attentionHex: "#B84D9C"),
        .november: TOFAMonthColors(monthName: "November", attentionName: "Violet Mark", attentionKey: "violet_mark", topographyHex: "#F4D5EF", darkInkHex: "#402D4A", midInkHex: "#786285", attentionHex: "#8561CB"),
        .december: TOFAMonthColors(monthName: "December", attentionName: "Indigo Pulse", attentionKey: "indigo_pulse", topographyHex: "#E1DAFB", darkInkHex: "#2F3251", midInkHex: "#696D95", attentionHex: "#5869E5")
    ]

    public static func shellTheme(for phase: TOFAPhase) -> TOFAResolvedTheme {
        switch phase {
        case .day:
            return TOFAResolvedTheme(
                code: .shellDay,
                displayName: "Shell Day",
                phase: .day,
                month: nil,
                backgroundHex: shellDay.paperHex,
                primaryTextHex: shellDay.inkHex,
                secondaryTextHex: shellDay.quietInkHex,
                lineHex: shellDay.inkHex,
                attentionHex: nil
            )
        case .night:
            return TOFAResolvedTheme(
                code: .shellNight,
                displayName: "Shell Night",
                phase: .night,
                month: nil,
                backgroundHex: shellNight.paperHex,
                primaryTextHex: shellNight.inkHex,
                secondaryTextHex: shellNight.quietInkHex,
                lineHex: shellNight.inkHex,
                attentionHex: nil
            )
        }
    }

    public static func monthlyTheme(for month: TOFAMonth, phase: TOFAPhase) -> TOFAResolvedTheme {
        let source = months[month] ?? months[.january]!

        switch phase {
        case .day:
            return TOFAResolvedTheme(
                code: code(for: month, phase: .day),
                displayName: "\(source.monthName) Day",
                phase: .day,
                month: month,
                backgroundHex: source.topographyHex,
                primaryTextHex: source.darkInkHex,
                secondaryTextHex: source.midInkHex,
                lineHex: source.attentionHex,
                attentionHex: source.attentionHex
            )
        case .night:
            return TOFAResolvedTheme(
                code: code(for: month, phase: .night),
                displayName: "\(source.monthName) Night",
                phase: .night,
                month: month,
                backgroundHex: source.darkInkHex,
                primaryTextHex: source.topographyHex,
                secondaryTextHex: source.midInkHex,
                lineHex: source.attentionHex,
                attentionHex: source.attentionHex
            )
        }
    }

    public static func bundle(month: TOFAMonth, phase: TOFAPhase) -> TOFAThemeBundle {
        TOFAThemeBundle(
            shell: shellTheme(for: phase),
            monthly: monthlyTheme(for: month, phase: phase)
        )
    }

    public static func theme(for code: TOFAThemeCode) -> TOFAResolvedTheme {
        if code.isShell {
            return shellTheme(for: code.phase)
        }
        guard let month = code.month else {
            return shellTheme(for: .day)
        }
        return monthlyTheme(for: month, phase: code.phase)
    }

    public static func allThemes() -> [TOFAResolvedTheme] {
        TOFAThemeCode.allCases.map(theme(for:))
    }

    public static var themeCount: Int { TOFAThemeCode.allCases.count }

    private static func code(for month: TOFAMonth, phase: TOFAPhase) -> TOFAThemeCode {
        switch (month, phase) {
        case (.january, .day): return .januaryDay
        case (.february, .day): return .februaryDay
        case (.march, .day): return .marchDay
        case (.april, .day): return .aprilDay
        case (.may, .day): return .mayDay
        case (.june, .day): return .juneDay
        case (.july, .day): return .julyDay
        case (.august, .day): return .augustDay
        case (.september, .day): return .septemberDay
        case (.october, .day): return .octoberDay
        case (.november, .day): return .novemberDay
        case (.december, .day): return .decemberDay
        case (.january, .night): return .januaryNight
        case (.february, .night): return .februaryNight
        case (.march, .night): return .marchNight
        case (.april, .night): return .aprilNight
        case (.may, .night): return .mayNight
        case (.june, .night): return .juneNight
        case (.july, .night): return .julyNight
        case (.august, .night): return .augustNight
        case (.september, .night): return .septemberNight
        case (.october, .night): return .octoberNight
        case (.november, .night): return .novemberNight
        case (.december, .night): return .decemberNight
        }
    }
}
