import SwiftUI

public enum TOFAThemeLibrary {
    public static let dayShell = TOFAShellReference(
        paperHex: "#F1F4F8",
        inkHex: "#202A38",
        quietInkHex: "#6A7384"
    )

    public static let nightShell = TOFAShellReference(
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

    public static func resolvedTheme(for month: TOFAMonth, mode: TOFAMode) -> TOFAResolvedTheme {
        guard let source = months[month] else {
            return TOFAResolvedTheme(
                background: Color(hex: "#F1F4F8"),
                primaryText: Color(hex: "#202A38"),
                secondaryText: Color(hex: "#6A7384"),
                line: Color(hex: "#202A38"),
                attention: Color(hex: "#5457E8")
            )
        }

        switch mode {
        case .day:
            return TOFAResolvedTheme(
                background: Color(hex: source.topographyHex),
                primaryText: Color(hex: source.darkInkHex),
                secondaryText: Color(hex: source.midInkHex),
                line: Color(hex: source.attentionHex),
                attention: Color(hex: source.attentionHex)
            )
        case .night:
            return TOFAResolvedTheme(
                background: Color(hex: source.darkInkHex),
                primaryText: Color(hex: source.topographyHex),
                secondaryText: Color(hex: source.midInkHex),
                line: Color(hex: source.attentionHex),
                attention: Color(hex: source.attentionHex)
            )
        }
    }
}
